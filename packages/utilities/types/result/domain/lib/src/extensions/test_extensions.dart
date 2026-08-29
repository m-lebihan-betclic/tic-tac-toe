import 'package:mockito/mockito.dart';
import 'package:types_result_domain/types_result_domain.dart';

extension WhenResult<T extends Object, E extends Object> on PostExpectation<Future<Result<T, E>?>> {
  void thenAnswerFailure(E failure) => thenAnswer((_) async => Failure(failure));

  void thenAnswerSuccess(T success) => thenAnswer((_) async => Success(success));
}

extension WhenUnitResult<E extends Object> on PostExpectation<Future<ResultDart<Unit, E>>> {
  void thenAnswerFailure(E failure) => thenAnswer((_) async => Failure(failure));

  void thenAnswerUnitSuccess() => thenAnswer((_) async => Success.unit<E>());
}
