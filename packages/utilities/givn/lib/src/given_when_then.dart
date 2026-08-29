import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:givn/src/stream_tester.dart';
import 'package:mockito/mockito.dart' as mock;
import 'package:riverpod/misc.dart';
import 'package:riverpod/riverpod.dart';

List<Override> _defaultProviders(TestContext context) => [];

/// Sentinel telling "no expected result provided" apart from an explicit null.
class _ExpectedResultNotProvided {
  const _ExpectedResultNotProvided();
}

const _expectedResultNotProvided = _ExpectedResultNotProvided();

Given<T> given<T>(
  String description,
  T Function(TestContext context) body, {
  List<mock.Mock> mocks = const [],
  List<Object?> parameters = const [],
  Map<String, Object?> namedParameters = const {},
  List<Override> Function(TestContext context) providers = _defaultProviders,
  Object? expectedResult = _expectedResultNotProvided,
}) {
  final mockers = Mockers._internal(mocks);
  final namedParamsMap = Map<String, Object?>.from(namedParameters);
  if (!identical(expectedResult, _expectedResultNotProvided)) {
    namedParamsMap['expectedResult'] = expectedResult;
  }

  /// This context is useful to give access to parameters and mocks to providers when initializing
  final testContextWithoutProviders = TestContext._internal(
    mockers,
    NamedParameters._internal(namedParamsMap),
    Parameters._internal(parameters),
    Providers._internal([]),
    TestStreamers._internal(),
  );
  final testContext = TestContext._internal(
    testContextWithoutProviders.mockers,
    testContextWithoutProviders.namedParameters,
    testContextWithoutProviders.parameters,
    Providers._internal(providers(testContextWithoutProviders)),
    testContextWithoutProviders._streamers,
  );
  return Given._internal(description, body, testContext);
}

class Mockers {
  static const empty = Mockers._internal([]);
  final List<mock.Mock> _mocks;

  const Mockers._internal(this._mocks);

  X of<X>({int? atIndex}) {
    final mocksOfType = _mocks.whereType<X>().toList();

    if (atIndex != null) {
      if (atIndex < 0 || atIndex >= mocksOfType.length) {
        throw RangeError.index(atIndex, mocksOfType, 'atIndex');
      }
      return mocksOfType[atIndex];
    }

    if (mocksOfType.isEmpty) {
      throw StateError('No mock found for type $X');
    }

    return mocksOfType.first;
  }

  void setUp() {}

  void tearDown() {
    for (final mockInstance in _mocks) {
      mock.reset(mockInstance);
    }
  }
}

class TestStreamers {
  static final empty = TestStreamers._internal();
  final Map<String, StreamTester<dynamic>> _streamTesters = {};

  TestStreamers._internal();

  StreamTester<T> of<T>(String name) {
    if (!_streamTesters.containsKey(name)) {
      _streamTesters[name] = StreamTester<T>();
    }

    final streamTester = _streamTesters[name];

    if (streamTester is! StreamTester<T>) {
      throw StateError('Parameter "$name" is not of type $T. Found: ${streamTester.runtimeType}');
    }
    return streamTester;
  }

  bool contains(String name) => _streamTesters.containsKey(name);

  void tearDown() {
    for (final streamTester in _streamTesters.values) {
      streamTester.dispose();
    }
  }
}

class Providers {
  static final empty = Providers._internal([]);

  final List<Override> _providers;

  ProviderContainer? ref;

  Providers._internal(this._providers);

  void setUp() {
    ref = ProviderContainer(overrides: _providers, retry: (_, _) => null);
  }

  void tearDown() {
    ref?.dispose();
  }
}

class Parameters {
  static const empty = Parameters._internal([]);
  final List<Object?> _parameters;

  const Parameters._internal(this._parameters);

  T of<T>({int? atIndex}) {
    final parametersOfType = _parameters.whereType<T>().toList();
    if (parametersOfType.isEmpty) {
      throw StateError('No parameter found');
    }

    if (atIndex != null) {
      if (atIndex < 0 || atIndex >= parametersOfType.length) {
        throw RangeError.index(atIndex, parametersOfType, 'atIndex');
      }
      return parametersOfType[atIndex];
    }

    return parametersOfType.first;
  }
}

class NamedParameters {
  static const empty = NamedParameters._internal({});
  final Map<String, Object?> _parameters;

  const NamedParameters._internal(this._parameters);

  T of<T>(String name) {
    if (!_parameters.containsKey(name)) {
      throw StateError('No parameter found with name "$name"');
    }

    final parameter = _parameters[name];

    if (parameter is! T) {
      throw StateError('Parameter "$name" is not of type $T. Found: ${parameter.runtimeType}');
    }
    return parameter;
  }

  bool contains(String name) => _parameters.containsKey(name);
}

class TestContext {
  final Providers _providers;
  final TestStreamers _streamers;
  final Mockers mockers;
  final NamedParameters namedParameters;
  final Parameters parameters;

  TestContext._internal(this.mockers, this.namedParameters, this.parameters, this._providers, this._streamers);

  X mockOf<X>({int? atIndex}) => mockers.of<X>(atIndex: atIndex);

  ProviderContainer get ref => _providers.ref!;

  T namedParameterOf<T>(String name) => namedParameters.of<T>(name);

  StreamTester<T> testStreamerOf<T>(String name) => _streamers.of<T>(name);

  bool hasNamedParameter(String name) => namedParameters.contains(name);

  T parameterOf<T>({int? atIndex}) => parameters.of<T>(atIndex: atIndex);

  P? expectedResult<P>() {
    if (!hasNamedParameter('expectedResult')) {
      throw StateError('No expected result found');
    }
    return namedParameterOf('expectedResult');
  }

  P requiredExpectedResult<P>() {
    final result = expectedResult<P>();
    if (result == null) {
      throw StateError('Expected result is null');
    }
    return result;
  }

  void setUp() {
    mockers.setUp();
    _providers.setUp();
  }

  void tearDown() {
    mockers.tearDown();
    _providers.tearDown();
    _streamers.tearDown();
  }
}

class Given<T> {
  final String description;
  final TestContext _context;
  final T Function(TestContext context) _body;

  T? _sut;

  Given._internal(this.description, this._body, this._context);

  When<T, R> when<R>(String description, FutureOr<R> Function(T sut, TestContext context) body) =>
      When._internal(this, description, body);

  T get sut => _sut ??= _body(_context);
}

class ThenAssert<T, R> {
  final String description;
  final FutureOr<void> Function(R result, TestContext context) body;

  ThenAssert(this.description, this.body);
}

class ThenAssertExpectedResult<T, R> extends ThenAssert<T, R> {
  ThenAssertExpectedResult(String description)
    : super(description, (result, context) {
        final expectedResult = context.expectedResult<R>();
        if (result != expectedResult) {
          fail('Expected result $expectedResult but got $result');
        }
      });
}

class When<T, R> {
  final Given<T> _given;

  final String description;

  final FutureOr<R> Function(T sut, TestContext context) _body;

  When._internal(this._given, this.description, this._body);

  void then(String description, FutureOr<void> Function(R result, TestContext context) body) =>
      Then._internal(this, description, body)._apply();

  void thenAssert(ThenAssert<T, R> def) => Then._internal(this, def.description, def.body)._apply();

  void thenShouldThrow(
    String description,
    FutureOr<void> Function(Object error, StackTrace stackTrace, TestContext context) body,
  ) => WhenThrows._internal(this, description, body)._apply();
}

int _testIndex = 1;

class Then<T, R> {
  final When<T, R> _when;

  final String description;

  final FutureOr<void> Function(R result, TestContext context) _body;

  Then._internal(this._when, this.description, this._body);

  void _apply() {
    tearDownAll(() {
      _testIndex = 0;
    });
    group('${_testIndex++}.', () {
      setUpAll(_when._given._context.setUp);
      tearDownAll(_when._given._context.tearDown);
      test('Given ${_when._given.description}\n\tWhen ${_when.description}\n\tThen $description\n', () async {
        final sut = _when._given.sut;
        final result = await _when._body(sut, _when._given._context);
        await _body(result, _when._given._context);
      });
    });
  }
}

class WhenThrows<T, R> {
  final When<T, R> _when;

  final String description;

  final FutureOr<void> Function(Object error, StackTrace stackTrace, TestContext context) _body;

  WhenThrows._internal(this._when, this.description, this._body);

  void _apply() {
    tearDownAll(() {
      _testIndex = 0;
    });
    group('${_testIndex++}.', () {
      setUpAll(_when._given._context.setUp);
      tearDownAll(_when._given._context.tearDown);
      test('Given ${_when._given.description}\n\tWhen ${_when.description}\n\tThen $description\n', () async {
        final sut = _when._given.sut;
        Object error;
        StackTrace stackTrace;
        try {
          await _when._body(sut, _when._given._context);
          fail('Expected an exception to be thrown but none was thrown.');
        } on Object catch (e, st) {
          error = e;
          stackTrace = st;
        }
        await _body(error, stackTrace, _when._given._context);
      });
    });
  }
}

extension StreamTesterExtension<T> on Stream<T> {
  void testStream(TestContext context, String name) => context.testStreamerOf<T>(name).start(this);
}

extension ObjectWhenExtension<T extends Object> on Given<T> {
  When<T, T> whenAccessingProperties([String description = 'accessing its properties']) =>
      When._internal(this, description, (sut, context) => sut);
}

const _readingProviderDescription = 'reading the provider';

extension ProviderWhenExtension<T extends ProviderBase<R>, R> on Given<T> {
  When<T, R> whenReadingProvider([String description = _readingProviderDescription]) =>
      When._internal(this, description, (sut, context) => context.ref.read(sut));

  /// Helper method to return a string error when the provider is unimplemented.
  When<T, String?> whenReadingUnimplementedProvider([String description = 'reading the unimplemented provider']) =>
      When._internal(this, description, (sut, context) {
        try {
          context.ref.read(sut);
          return null;
        } on Object catch (e) {
          return e.toString();
        }
      });

  When<T, R> whenReadingFutureProvider([String description = _readingProviderDescription]) =>
      When._internal(this, description, (sut, context) async {
        context.ref.read(sut);
        await Future.microtask(() {});
        return context.ref.read(sut);
      });
}

extension ProviderListenableWhenExtension<T extends ProviderListenable<R>, R> on Given<T> {
  When<T, R> whenReadingProvider([String description = _readingProviderDescription]) =>
      When._internal(this, description, (sut, context) => context.ref.read(sut));
}
