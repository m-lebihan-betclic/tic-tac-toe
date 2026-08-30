import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:session_domain/session_domain.dart';

part 'session_snapshot.br.freezed.dart';

/// Everything the session holds, as one immutable value.
///
/// One object rather than four fields, because it is what the store emits: a write produces a new
/// snapshot, and everything reading the session rebuilds off that. Four independently mutable
/// fields would notify nobody.
@freezed
abstract class SessionSnapshot with _$SessionSnapshot {
  const factory SessionSnapshot({
    Difficulty? difficulty,
    AppLocale? locale,
    Player? player,
    AppTheme? theme,
  }) = _SessionSnapshot;
}
