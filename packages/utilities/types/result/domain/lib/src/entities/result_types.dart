import 'package:result_dart/result_dart.dart' hide AsyncResult, Result;

typedef AsyncUnitResult<E extends Object> = AsyncResultDart<Unit, E>;
typedef Result<T extends Object, E extends Object> = ResultDart<T, E>;
typedef AsyncResult<T extends Object, E extends Object> = AsyncResultDart<T, E>;
