// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move_error.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoveError {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoveError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoveError()';
}


}

/// @nodoc
class $MoveErrorCopyWith<$Res>  {
$MoveErrorCopyWith(MoveError _, $Res Function(MoveError) __);
}


/// Adds pattern-matching-related methods to [MoveError].
extension MoveErrorPatterns on MoveError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GameOver value)?  gameOver,TResult Function( NotYourTurn value)?  notYourTurn,TResult Function( SlotTaken value)?  slotTaken,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GameOver() when gameOver != null:
return gameOver(_that);case NotYourTurn() when notYourTurn != null:
return notYourTurn(_that);case SlotTaken() when slotTaken != null:
return slotTaken(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GameOver value)  gameOver,required TResult Function( NotYourTurn value)  notYourTurn,required TResult Function( SlotTaken value)  slotTaken,}){
final _that = this;
switch (_that) {
case GameOver():
return gameOver(_that);case NotYourTurn():
return notYourTurn(_that);case SlotTaken():
return slotTaken(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GameOver value)?  gameOver,TResult? Function( NotYourTurn value)?  notYourTurn,TResult? Function( SlotTaken value)?  slotTaken,}){
final _that = this;
switch (_that) {
case GameOver() when gameOver != null:
return gameOver(_that);case NotYourTurn() when notYourTurn != null:
return notYourTurn(_that);case SlotTaken() when slotTaken != null:
return slotTaken(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  gameOver,TResult Function()?  notYourTurn,TResult Function()?  slotTaken,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameOver() when gameOver != null:
return gameOver();case NotYourTurn() when notYourTurn != null:
return notYourTurn();case SlotTaken() when slotTaken != null:
return slotTaken();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  gameOver,required TResult Function()  notYourTurn,required TResult Function()  slotTaken,}) {final _that = this;
switch (_that) {
case GameOver():
return gameOver();case NotYourTurn():
return notYourTurn();case SlotTaken():
return slotTaken();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  gameOver,TResult? Function()?  notYourTurn,TResult? Function()?  slotTaken,}) {final _that = this;
switch (_that) {
case GameOver() when gameOver != null:
return gameOver();case NotYourTurn() when notYourTurn != null:
return notYourTurn();case SlotTaken() when slotTaken != null:
return slotTaken();case _:
  return null;

}
}

}

/// @nodoc


class GameOver implements MoveError {
  const GameOver();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameOver);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoveError.gameOver()';
}


}




/// @nodoc


class NotYourTurn implements MoveError {
  const NotYourTurn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotYourTurn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoveError.notYourTurn()';
}


}




/// @nodoc


class SlotTaken implements MoveError {
  const SlotTaken();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SlotTaken);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoveError.slotTaken()';
}


}




// dart format on
