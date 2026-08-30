// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_status.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus()';
}


}

/// @nodoc
class $GameStatusCopyWith<$Res>  {
$GameStatusCopyWith(GameStatus _, $Res Function(GameStatus) __);
}


/// Adds pattern-matching-related methods to [GameStatus].
extension GameStatusPatterns on GameStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CpuTurn value)?  cpuTurn,TResult Function( Finished value)?  finished,TResult Function( PlayerTurn value)?  playerTurn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CpuTurn() when cpuTurn != null:
return cpuTurn(_that);case Finished() when finished != null:
return finished(_that);case PlayerTurn() when playerTurn != null:
return playerTurn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CpuTurn value)  cpuTurn,required TResult Function( Finished value)  finished,required TResult Function( PlayerTurn value)  playerTurn,}){
final _that = this;
switch (_that) {
case CpuTurn():
return cpuTurn(_that);case Finished():
return finished(_that);case PlayerTurn():
return playerTurn(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CpuTurn value)?  cpuTurn,TResult? Function( Finished value)?  finished,TResult? Function( PlayerTurn value)?  playerTurn,}){
final _that = this;
switch (_that) {
case CpuTurn() when cpuTurn != null:
return cpuTurn(_that);case Finished() when finished != null:
return finished(_that);case PlayerTurn() when playerTurn != null:
return playerTurn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  cpuTurn,TResult Function( GameOutcome outcome,  Set<WinningLine> winningLines)?  finished,TResult Function()?  playerTurn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CpuTurn() when cpuTurn != null:
return cpuTurn();case Finished() when finished != null:
return finished(_that.outcome,_that.winningLines);case PlayerTurn() when playerTurn != null:
return playerTurn();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  cpuTurn,required TResult Function( GameOutcome outcome,  Set<WinningLine> winningLines)  finished,required TResult Function()  playerTurn,}) {final _that = this;
switch (_that) {
case CpuTurn():
return cpuTurn();case Finished():
return finished(_that.outcome,_that.winningLines);case PlayerTurn():
return playerTurn();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  cpuTurn,TResult? Function( GameOutcome outcome,  Set<WinningLine> winningLines)?  finished,TResult? Function()?  playerTurn,}) {final _that = this;
switch (_that) {
case CpuTurn() when cpuTurn != null:
return cpuTurn();case Finished() when finished != null:
return finished(_that.outcome,_that.winningLines);case PlayerTurn() when playerTurn != null:
return playerTurn();case _:
  return null;

}
}

}

/// @nodoc


class CpuTurn implements GameStatus {
  const CpuTurn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CpuTurn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus.cpuTurn()';
}


}




/// @nodoc


class Finished implements GameStatus {
  const Finished({required this.outcome, final  Set<WinningLine> winningLines = const <WinningLine>{}}): _winningLines = winningLines;
  

 final  GameOutcome outcome;
 final  Set<WinningLine> _winningLines;
@JsonKey() Set<WinningLine> get winningLines {
  if (_winningLines is EqualUnmodifiableSetView) return _winningLines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_winningLines);
}


/// Create a copy of GameStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinishedCopyWith<Finished> get copyWith => _$FinishedCopyWithImpl<Finished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Finished&&(identical(other.outcome, outcome) || other.outcome == outcome)&&const DeepCollectionEquality().equals(other._winningLines, _winningLines));
}


@override
int get hashCode => Object.hash(runtimeType,outcome,const DeepCollectionEquality().hash(_winningLines));

@override
String toString() {
  return 'GameStatus.finished(outcome: $outcome, winningLines: $winningLines)';
}


}

/// @nodoc
abstract mixin class $FinishedCopyWith<$Res> implements $GameStatusCopyWith<$Res> {
  factory $FinishedCopyWith(Finished value, $Res Function(Finished) _then) = _$FinishedCopyWithImpl;
@useResult
$Res call({
 GameOutcome outcome, Set<WinningLine> winningLines
});




}
/// @nodoc
class _$FinishedCopyWithImpl<$Res>
    implements $FinishedCopyWith<$Res> {
  _$FinishedCopyWithImpl(this._self, this._then);

  final Finished _self;
  final $Res Function(Finished) _then;

/// Create a copy of GameStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outcome = null,Object? winningLines = null,}) {
  return _then(Finished(
outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,winningLines: null == winningLines ? _self._winningLines : winningLines // ignore: cast_nullable_to_non_nullable
as Set<WinningLine>,
  ));
}


}

/// @nodoc


class PlayerTurn implements GameStatus {
  const PlayerTurn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerTurn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus.playerTurn()';
}


}




// dart format on
