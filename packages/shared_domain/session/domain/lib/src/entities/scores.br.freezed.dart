// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scores.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Scores {

 int get drawn; int get lost; int get won;
/// Create a copy of Scores
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoresCopyWith<Scores> get copyWith => _$ScoresCopyWithImpl<Scores>(this as Scores, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Scores&&(identical(other.drawn, drawn) || other.drawn == drawn)&&(identical(other.lost, lost) || other.lost == lost)&&(identical(other.won, won) || other.won == won));
}


@override
int get hashCode => Object.hash(runtimeType,drawn,lost,won);

@override
String toString() {
  return 'Scores(drawn: $drawn, lost: $lost, won: $won)';
}


}

/// @nodoc
abstract mixin class $ScoresCopyWith<$Res>  {
  factory $ScoresCopyWith(Scores value, $Res Function(Scores) _then) = _$ScoresCopyWithImpl;
@useResult
$Res call({
 int drawn, int lost, int won
});




}
/// @nodoc
class _$ScoresCopyWithImpl<$Res>
    implements $ScoresCopyWith<$Res> {
  _$ScoresCopyWithImpl(this._self, this._then);

  final Scores _self;
  final $Res Function(Scores) _then;

/// Create a copy of Scores
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? drawn = null,Object? lost = null,Object? won = null,}) {
  return _then(_self.copyWith(
drawn: null == drawn ? _self.drawn : drawn // ignore: cast_nullable_to_non_nullable
as int,lost: null == lost ? _self.lost : lost // ignore: cast_nullable_to_non_nullable
as int,won: null == won ? _self.won : won // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Scores].
extension ScoresPatterns on Scores {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Scores value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Scores() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Scores value)  $default,){
final _that = this;
switch (_that) {
case _Scores():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Scores value)?  $default,){
final _that = this;
switch (_that) {
case _Scores() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int drawn,  int lost,  int won)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Scores() when $default != null:
return $default(_that.drawn,_that.lost,_that.won);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int drawn,  int lost,  int won)  $default,) {final _that = this;
switch (_that) {
case _Scores():
return $default(_that.drawn,_that.lost,_that.won);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int drawn,  int lost,  int won)?  $default,) {final _that = this;
switch (_that) {
case _Scores() when $default != null:
return $default(_that.drawn,_that.lost,_that.won);case _:
  return null;

}
}

}

/// @nodoc


class _Scores extends Scores {
  const _Scores({this.drawn = 0, this.lost = 0, this.won = 0}): super._();
  

@override@JsonKey() final  int drawn;
@override@JsonKey() final  int lost;
@override@JsonKey() final  int won;

/// Create a copy of Scores
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoresCopyWith<_Scores> get copyWith => __$ScoresCopyWithImpl<_Scores>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Scores&&(identical(other.drawn, drawn) || other.drawn == drawn)&&(identical(other.lost, lost) || other.lost == lost)&&(identical(other.won, won) || other.won == won));
}


@override
int get hashCode => Object.hash(runtimeType,drawn,lost,won);

@override
String toString() {
  return 'Scores(drawn: $drawn, lost: $lost, won: $won)';
}


}

/// @nodoc
abstract mixin class _$ScoresCopyWith<$Res> implements $ScoresCopyWith<$Res> {
  factory _$ScoresCopyWith(_Scores value, $Res Function(_Scores) _then) = __$ScoresCopyWithImpl;
@override @useResult
$Res call({
 int drawn, int lost, int won
});




}
/// @nodoc
class __$ScoresCopyWithImpl<$Res>
    implements _$ScoresCopyWith<$Res> {
  __$ScoresCopyWithImpl(this._self, this._then);

  final _Scores _self;
  final $Res Function(_Scores) _then;

/// Create a copy of Scores
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? drawn = null,Object? lost = null,Object? won = null,}) {
  return _then(_Scores(
drawn: null == drawn ? _self.drawn : drawn // ignore: cast_nullable_to_non_nullable
as int,lost: null == lost ? _self.lost : lost // ignore: cast_nullable_to_non_nullable
as int,won: null == won ? _self.won : won // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
