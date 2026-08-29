import 'package:flutter_test/flutter_test.dart';
import 'package:givn/givn.dart';
import 'package:mockito/mockito.dart' as mock;
import 'package:riverpod_annotation/riverpod_annotation.dart';

List<Override> _defaultProviders(TestContext _) => [];

class _WidgetTestSetup<T> {
  final T sut;
  final TestContext context;
  final List<Override> providers;

  _WidgetTestSetup(this.sut, this.context, this.providers);
}

WidgetGiven<T> givenWidget<T>(
  String description,
  T Function(TestContext context) body, {
  List<mock.Mock> mocks = const [],
  Map<String, Object?> namedParameters = const {},
  List<Override> Function(TestContext context) providers = _defaultProviders,
}) {
  final givnGiven = given<_WidgetTestSetup<T>>(
    description,
    (TestContext context) {
      final sut = body(context);
      final providerList = providers(context);
      return _WidgetTestSetup(sut, context, providerList);
    },
    mocks: mocks,
    namedParameters: namedParameters,
  );

  return WidgetGiven._fromGiven(givnGiven);
}

class WidgetGiven<T> {
  final Given<_WidgetTestSetup<T>> _given;

  WidgetGiven._fromGiven(this._given);

  WidgetWhen<T, R> when<R>(
    String description,
    FutureOr<R> Function(T sut, TestContext context, WidgetTester tester, List<Override> providers) body,
  ) => WidgetWhen._internal(this, description, body);
}

class WidgetWhen<T, R> {
  final WidgetGiven<T> _given;
  final String description;
  final FutureOr<R> Function(T sut, TestContext context, WidgetTester tester, List<Override> providers) _body;

  WidgetWhen._internal(this._given, this.description, this._body);

  void then(
    String description,
    FutureOr<void> Function(R result, TestContext context, WidgetTester tester) body,
  ) => WidgetThen._internal(this, description, body)._apply();
}

int _widgetTestIndex = 1;

class WidgetThen<T, R> {
  final WidgetWhen<T, R> _when;
  final String description;
  final FutureOr<void> Function(R result, TestContext context, WidgetTester tester) _body;

  WidgetThen._internal(this._when, this.description, this._body);

  void _apply() {
    tearDownAll(() {
      _widgetTestIndex = 0;
    });
    group('${_widgetTestIndex++}.', () {
      testWidgets(
        'Given ${_when._given._given.description}\n\tWhen ${_when.description}\n\tThen $description\n',
        (tester) async {
          final setup = _when._given._given.sut;
          final contextWithProviders = setup.context;
          final providers = setup.providers;

          final result = await _when._body(
            setup.sut,
            contextWithProviders,
            tester,
            providers,
          );

          await _body(result, contextWithProviders, tester);
        },
      );
    });
  }
}
