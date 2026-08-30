// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_banner.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatusBanner {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusBanner);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatusBanner()';
}


}

/// @nodoc
class $StatusBannerCopyWith<$Res>  {
$StatusBannerCopyWith(StatusBanner _, $Res Function(StatusBanner) __);
}


/// Adds pattern-matching-related methods to [StatusBanner].
extension StatusBannerPatterns on StatusBanner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Cleared value)?  cleared,TResult Function( Invalid value)?  invalid,TResult Function( Over value)?  over,TResult Function( Thinking value)?  thinking,TResult Function( Turn value)?  turn,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Cleared() when cleared != null:
return cleared(_that);case Invalid() when invalid != null:
return invalid(_that);case Over() when over != null:
return over(_that);case Thinking() when thinking != null:
return thinking(_that);case Turn() when turn != null:
return turn(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Cleared value)  cleared,required TResult Function( Invalid value)  invalid,required TResult Function( Over value)  over,required TResult Function( Thinking value)  thinking,required TResult Function( Turn value)  turn,}){
final _that = this;
switch (_that) {
case Cleared():
return cleared(_that);case Invalid():
return invalid(_that);case Over():
return over(_that);case Thinking():
return thinking(_that);case Turn():
return turn(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Cleared value)?  cleared,TResult? Function( Invalid value)?  invalid,TResult? Function( Over value)?  over,TResult? Function( Thinking value)?  thinking,TResult? Function( Turn value)?  turn,}){
final _that = this;
switch (_that) {
case Cleared() when cleared != null:
return cleared(_that);case Invalid() when invalid != null:
return invalid(_that);case Over() when over != null:
return over(_that);case Thinking() when thinking != null:
return thinking(_that);case Turn() when turn != null:
return turn(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  cleared,TResult Function( int slot)?  invalid,TResult Function( GameOutcome outcome)?  over,TResult Function()?  thinking,TResult Function()?  turn,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Cleared() when cleared != null:
return cleared();case Invalid() when invalid != null:
return invalid(_that.slot);case Over() when over != null:
return over(_that.outcome);case Thinking() when thinking != null:
return thinking();case Turn() when turn != null:
return turn();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  cleared,required TResult Function( int slot)  invalid,required TResult Function( GameOutcome outcome)  over,required TResult Function()  thinking,required TResult Function()  turn,}) {final _that = this;
switch (_that) {
case Cleared():
return cleared();case Invalid():
return invalid(_that.slot);case Over():
return over(_that.outcome);case Thinking():
return thinking();case Turn():
return turn();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  cleared,TResult? Function( int slot)?  invalid,TResult? Function( GameOutcome outcome)?  over,TResult? Function()?  thinking,TResult? Function()?  turn,}) {final _that = this;
switch (_that) {
case Cleared() when cleared != null:
return cleared();case Invalid() when invalid != null:
return invalid(_that.slot);case Over() when over != null:
return over(_that.outcome);case Thinking() when thinking != null:
return thinking();case Turn() when turn != null:
return turn();case _:
  return null;

}
}

}

/// @nodoc


class Cleared implements StatusBanner {
  const Cleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatusBanner.cleared()';
}


}




/// @nodoc


class Invalid implements StatusBanner {
  const Invalid({required this.slot});
  

 final  int slot;

/// Create a copy of StatusBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidCopyWith<Invalid> get copyWith => _$InvalidCopyWithImpl<Invalid>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Invalid&&(identical(other.slot, slot) || other.slot == slot));
}


@override
int get hashCode => Object.hash(runtimeType,slot);

@override
String toString() {
  return 'StatusBanner.invalid(slot: $slot)';
}


}

/// @nodoc
abstract mixin class $InvalidCopyWith<$Res> implements $StatusBannerCopyWith<$Res> {
  factory $InvalidCopyWith(Invalid value, $Res Function(Invalid) _then) = _$InvalidCopyWithImpl;
@useResult
$Res call({
 int slot
});




}
/// @nodoc
class _$InvalidCopyWithImpl<$Res>
    implements $InvalidCopyWith<$Res> {
  _$InvalidCopyWithImpl(this._self, this._then);

  final Invalid _self;
  final $Res Function(Invalid) _then;

/// Create a copy of StatusBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slot = null,}) {
  return _then(Invalid(
slot: null == slot ? _self.slot : slot // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class Over implements StatusBanner {
  const Over({required this.outcome});
  

 final  GameOutcome outcome;

/// Create a copy of StatusBanner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverCopyWith<Over> get copyWith => _$OverCopyWithImpl<Over>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Over&&(identical(other.outcome, outcome) || other.outcome == outcome));
}


@override
int get hashCode => Object.hash(runtimeType,outcome);

@override
String toString() {
  return 'StatusBanner.over(outcome: $outcome)';
}


}

/// @nodoc
abstract mixin class $OverCopyWith<$Res> implements $StatusBannerCopyWith<$Res> {
  factory $OverCopyWith(Over value, $Res Function(Over) _then) = _$OverCopyWithImpl;
@useResult
$Res call({
 GameOutcome outcome
});




}
/// @nodoc
class _$OverCopyWithImpl<$Res>
    implements $OverCopyWith<$Res> {
  _$OverCopyWithImpl(this._self, this._then);

  final Over _self;
  final $Res Function(Over) _then;

/// Create a copy of StatusBanner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? outcome = null,}) {
  return _then(Over(
outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as GameOutcome,
  ));
}


}

/// @nodoc


class Thinking implements StatusBanner {
  const Thinking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Thinking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatusBanner.thinking()';
}


}




/// @nodoc


class Turn implements StatusBanner {
  const Turn();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Turn);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatusBanner.turn()';
}


}




// dart format on
