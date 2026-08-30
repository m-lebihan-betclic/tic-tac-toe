// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup_form_state.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SetupFormState {

 Difficulty get difficulty; String get name;/// Null until a chip is tapped, which is what lets the sheet open wearing the platform's own
/// light or dark rather than a stored choice nobody has made yet.
 AppTheme? get theme;
/// Create a copy of SetupFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetupFormStateCopyWith<SetupFormState> get copyWith => _$SetupFormStateCopyWithImpl<SetupFormState>(this as SetupFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetupFormState&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.name, name) || other.name == name)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,difficulty,name,theme);

@override
String toString() {
  return 'SetupFormState(difficulty: $difficulty, name: $name, theme: $theme)';
}


}

/// @nodoc
abstract mixin class $SetupFormStateCopyWith<$Res>  {
  factory $SetupFormStateCopyWith(SetupFormState value, $Res Function(SetupFormState) _then) = _$SetupFormStateCopyWithImpl;
@useResult
$Res call({
 Difficulty difficulty, String name, AppTheme? theme
});




}
/// @nodoc
class _$SetupFormStateCopyWithImpl<$Res>
    implements $SetupFormStateCopyWith<$Res> {
  _$SetupFormStateCopyWithImpl(this._self, this._then);

  final SetupFormState _self;
  final $Res Function(SetupFormState) _then;

/// Create a copy of SetupFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? difficulty = null,Object? name = null,Object? theme = freezed,}) {
  return _then(_self.copyWith(
difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme?,
  ));
}

}


/// Adds pattern-matching-related methods to [SetupFormState].
extension SetupFormStatePatterns on SetupFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetupFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetupFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetupFormState value)  $default,){
final _that = this;
switch (_that) {
case _SetupFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetupFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SetupFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Difficulty difficulty,  String name,  AppTheme? theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetupFormState() when $default != null:
return $default(_that.difficulty,_that.name,_that.theme);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Difficulty difficulty,  String name,  AppTheme? theme)  $default,) {final _that = this;
switch (_that) {
case _SetupFormState():
return $default(_that.difficulty,_that.name,_that.theme);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Difficulty difficulty,  String name,  AppTheme? theme)?  $default,) {final _that = this;
switch (_that) {
case _SetupFormState() when $default != null:
return $default(_that.difficulty,_that.name,_that.theme);case _:
  return null;

}
}

}

/// @nodoc


class _SetupFormState extends SetupFormState {
  const _SetupFormState({required this.difficulty, required this.name, this.theme}): super._();
  

@override final  Difficulty difficulty;
@override final  String name;
/// Null until a chip is tapped, which is what lets the sheet open wearing the platform's own
/// light or dark rather than a stored choice nobody has made yet.
@override final  AppTheme? theme;

/// Create a copy of SetupFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetupFormStateCopyWith<_SetupFormState> get copyWith => __$SetupFormStateCopyWithImpl<_SetupFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetupFormState&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.name, name) || other.name == name)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode => Object.hash(runtimeType,difficulty,name,theme);

@override
String toString() {
  return 'SetupFormState(difficulty: $difficulty, name: $name, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$SetupFormStateCopyWith<$Res> implements $SetupFormStateCopyWith<$Res> {
  factory _$SetupFormStateCopyWith(_SetupFormState value, $Res Function(_SetupFormState) _then) = __$SetupFormStateCopyWithImpl;
@override @useResult
$Res call({
 Difficulty difficulty, String name, AppTheme? theme
});




}
/// @nodoc
class __$SetupFormStateCopyWithImpl<$Res>
    implements _$SetupFormStateCopyWith<$Res> {
  __$SetupFormStateCopyWithImpl(this._self, this._then);

  final _SetupFormState _self;
  final $Res Function(_SetupFormState) _then;

/// Create a copy of SetupFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? difficulty = null,Object? name = null,Object? theme = freezed,}) {
  return _then(_SetupFormState(
difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as Difficulty,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,theme: freezed == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme?,
  ));
}


}

// dart format on
