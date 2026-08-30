// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'round.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Round {

 Difficulty get difficulty; int get moveCount; GameOutcome get outcome; Set<WinningLine> get winningLines;
/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoundCopyWith<Round> get copyWith => _$RoundCopyWithImpl<Round>(this as Round, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Round&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&const DeepCollectionEquality().equals(other.winningLines, winningLines));
}


@override
int get hashCode => Object.hash(runtimeType,difficulty,moveCount,outcome,const DeepCollectionEquality().hash(winningLines));

@override
String toString() {
  return 'Round(difficulty: $difficulty, moveCount: $moveCount, outcome: $outcome, winningLines: $winningLines)';
}


}

/// @nodoc
abstract mixin class $RoundCopyWith<$Res>  {
  factory $RoundCopyWith(Round value, $Res Function(Round) _then) = _$RoundCopyWithImpl;
@useResult
$Res call({
 Difficulty difficulty, int moveCount, GameOutcome outcome, Set<WinningLine> winningLines
});




}
/// @nodoc
class _$RoundCopyWithImpl<$Res>
    implements $RoundCopyWith<$Res> {
  _$RoundCopyWithImpl(this._self, this._then);

  final Round _self;
  final $Res Function(Round) _then;

/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? difficulty = null,Object? moveCount = null,Object? outcome = null,Object? winningLines = null,}) {
  return _then(_self.copyWith(
difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,moveCount: null == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,winningLines: null == winningLines ? _self.winningLines : winningLines // ignore: cast_nullable_to_non_nullable
as Set<WinningLine>,
  ));
}

}


/// Adds pattern-matching-related methods to [Round].
extension RoundPatterns on Round {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Round value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Round() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Round value)  $default,){
final _that = this;
switch (_that) {
case _Round():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Round value)?  $default,){
final _that = this;
switch (_that) {
case _Round() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Difficulty difficulty,  int moveCount,  GameOutcome outcome,  Set<WinningLine> winningLines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Round() when $default != null:
return $default(_that.difficulty,_that.moveCount,_that.outcome,_that.winningLines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Difficulty difficulty,  int moveCount,  GameOutcome outcome,  Set<WinningLine> winningLines)  $default,) {final _that = this;
switch (_that) {
case _Round():
return $default(_that.difficulty,_that.moveCount,_that.outcome,_that.winningLines);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Difficulty difficulty,  int moveCount,  GameOutcome outcome,  Set<WinningLine> winningLines)?  $default,) {final _that = this;
switch (_that) {
case _Round() when $default != null:
return $default(_that.difficulty,_that.moveCount,_that.outcome,_that.winningLines);case _:
  return null;

}
}

}

/// @nodoc


class _Round implements Round {
  const _Round({required this.difficulty, required this.moveCount, required this.outcome, final  Set<WinningLine> winningLines = const <WinningLine>{}}): _winningLines = winningLines;
  

@override final  Difficulty difficulty;
@override final  int moveCount;
@override final  GameOutcome outcome;
 final  Set<WinningLine> _winningLines;
@override@JsonKey() Set<WinningLine> get winningLines {
  if (_winningLines is EqualUnmodifiableSetView) return _winningLines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_winningLines);
}


/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoundCopyWith<_Round> get copyWith => __$RoundCopyWithImpl<_Round>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Round&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.moveCount, moveCount) || other.moveCount == moveCount)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&const DeepCollectionEquality().equals(other._winningLines, _winningLines));
}


@override
int get hashCode => Object.hash(runtimeType,difficulty,moveCount,outcome,const DeepCollectionEquality().hash(_winningLines));

@override
String toString() {
  return 'Round(difficulty: $difficulty, moveCount: $moveCount, outcome: $outcome, winningLines: $winningLines)';
}


}

/// @nodoc
abstract mixin class _$RoundCopyWith<$Res> implements $RoundCopyWith<$Res> {
  factory _$RoundCopyWith(_Round value, $Res Function(_Round) _then) = __$RoundCopyWithImpl;
@override @useResult
$Res call({
 Difficulty difficulty, int moveCount, GameOutcome outcome, Set<WinningLine> winningLines
});




}
/// @nodoc
class __$RoundCopyWithImpl<$Res>
    implements _$RoundCopyWith<$Res> {
  __$RoundCopyWithImpl(this._self, this._then);

  final _Round _self;
  final $Res Function(_Round) _then;

/// Create a copy of Round
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? difficulty = null,Object? moveCount = null,Object? outcome = null,Object? winningLines = null,}) {
  return _then(_Round(
difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,moveCount: null == moveCount ? _self.moveCount : moveCount // ignore: cast_nullable_to_non_nullable
as int,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,winningLines: null == winningLines ? _self._winningLines : winningLines // ignore: cast_nullable_to_non_nullable
as Set<WinningLine>,
  ));
}


}

// dart format on
