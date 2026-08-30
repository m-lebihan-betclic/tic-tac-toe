// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_snapshot.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionSnapshot {

 Difficulty? get difficulty; AppLocale? get locale; Player? get player; AppTheme? get theme;
/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionSnapshotCopyWith<SessionSnapshot> get copyWith => _$SessionSnapshotCopyWithImpl<SessionSnapshot>(this as SessionSnapshot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionSnapshot&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.player, player) || other.player == player)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,difficulty,locale,player,theme);

@override
String toString() {
  return 'SessionSnapshot(difficulty: $difficulty, locale: $locale, player: $player, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $SessionSnapshotCopyWith<$Res>  {
  factory $SessionSnapshotCopyWith(SessionSnapshot value, $Res Function(SessionSnapshot) _then) = _$SessionSnapshotCopyWithImpl;
@useResult
$Res call({
 Difficulty? difficulty, AppLocale? locale, Player? player, AppTheme? theme
});




}
/// @nodoc
class _$SessionSnapshotCopyWithImpl<$Res>
    implements $SessionSnapshotCopyWith<$Res> {
  _$SessionSnapshotCopyWithImpl(this._self, this._then);

  final SessionSnapshot _self;
  final $Res Function(SessionSnapshot) _then;

/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? difficulty = freezed,Object? locale = freezed,Object? player = freezed,Object? theme = freezed,}) {
  return _then(_self.copyWith(
difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocale?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionSnapshot].
extension SessionSnapshotPatterns on SessionSnapshot {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _SessionSnapshot():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Difficulty? difficulty,  AppLocale? locale,  Player? player,  AppTheme? theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that.difficulty,_that.locale,_that.player,_that.theme);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Difficulty? difficulty,  AppLocale? locale,  Player? player,  AppTheme? theme)  $default,) {final _that = this;
switch (_that) {
case _SessionSnapshot():
return $default(_that.difficulty,_that.locale,_that.player,_that.theme);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Difficulty? difficulty,  AppLocale? locale,  Player? player,  AppTheme? theme)?  $default,) {final _that = this;
switch (_that) {
case _SessionSnapshot() when $default != null:
return $default(_that.difficulty,_that.locale,_that.player,_that.theme);case _:
  return null;

}
}

}

/// @nodoc


class _SessionSnapshot implements SessionSnapshot {
  const _SessionSnapshot({this.difficulty, this.locale, this.player, this.theme});
  

@override final  Difficulty? difficulty;
@override final  AppLocale? locale;
@override final  Player? player;
@override final  AppTheme? theme;

/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionSnapshotCopyWith<_SessionSnapshot> get copyWith => __$SessionSnapshotCopyWithImpl<_SessionSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionSnapshot&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.player, player) || other.player == player)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,difficulty,locale,player,theme);

@override
String toString() {
  return 'SessionSnapshot(difficulty: $difficulty, locale: $locale, player: $player, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$SessionSnapshotCopyWith<$Res> implements $SessionSnapshotCopyWith<$Res> {
  factory _$SessionSnapshotCopyWith(_SessionSnapshot value, $Res Function(_SessionSnapshot) _then) = __$SessionSnapshotCopyWithImpl;
@override @useResult
$Res call({
 Difficulty? difficulty, AppLocale? locale, Player? player, AppTheme? theme
});




}
/// @nodoc
class __$SessionSnapshotCopyWithImpl<$Res>
    implements _$SessionSnapshotCopyWith<$Res> {
  __$SessionSnapshotCopyWithImpl(this._self, this._then);

  final _SessionSnapshot _self;
  final $Res Function(_SessionSnapshot) _then;

/// Create a copy of SessionSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? difficulty = freezed,Object? locale = freezed,Object? player = freezed,Object? theme = freezed,}) {
  return _then(_SessionSnapshot(
difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty?,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as AppLocale?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player?,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme?,
  ));
}


}

// dart format on
