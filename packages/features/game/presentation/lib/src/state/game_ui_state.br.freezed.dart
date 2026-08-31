// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_ui_state.br.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameUiState {

 StatusBanner get banner; Game get game;
/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameUiStateCopyWith<GameUiState> get copyWith => _$GameUiStateCopyWithImpl<GameUiState>(this as GameUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameUiState&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.game, game) || other.game == game));
}


@override
int get hashCode => Object.hash(runtimeType,banner,game);

@override
String toString() {
  return 'GameUiState(banner: $banner, game: $game)';
}


}

/// @nodoc
abstract mixin class $GameUiStateCopyWith<$Res>  {
  factory $GameUiStateCopyWith(GameUiState value, $Res Function(GameUiState) _then) = _$GameUiStateCopyWithImpl;
@useResult
$Res call({
 StatusBanner banner, Game game
});


$StatusBannerCopyWith<$Res> get banner;$GameCopyWith<$Res> get game;

}
/// @nodoc
class _$GameUiStateCopyWithImpl<$Res>
    implements $GameUiStateCopyWith<$Res> {
  _$GameUiStateCopyWithImpl(this._self, this._then);

  final GameUiState _self;
  final $Res Function(GameUiState) _then;

/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? banner = null,Object? game = null,}) {
  return _then(_self.copyWith(
banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as StatusBanner,game: null == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as Game,
  ));
}
/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusBannerCopyWith<$Res> get banner {
  
  return $StatusBannerCopyWith<$Res>(_self.banner, (value) {
    return _then(_self.copyWith(banner: value));
  });
}/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameCopyWith<$Res> get game {
  
  return $GameCopyWith<$Res>(_self.game, (value) {
    return _then(_self.copyWith(game: value));
  });
}
}


/// Adds pattern-matching-related methods to [GameUiState].
extension GameUiStatePatterns on GameUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameUiState value)  $default,){
final _that = this;
switch (_that) {
case _GameUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameUiState value)?  $default,){
final _that = this;
switch (_that) {
case _GameUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StatusBanner banner,  Game game)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameUiState() when $default != null:
return $default(_that.banner,_that.game);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StatusBanner banner,  Game game)  $default,) {final _that = this;
switch (_that) {
case _GameUiState():
return $default(_that.banner,_that.game);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StatusBanner banner,  Game game)?  $default,) {final _that = this;
switch (_that) {
case _GameUiState() when $default != null:
return $default(_that.banner,_that.game);case _:
  return null;

}
}

}

/// @nodoc


class _GameUiState extends GameUiState {
  const _GameUiState({required this.banner, required this.game}): super._();
  

@override final  StatusBanner banner;
@override final  Game game;

/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameUiStateCopyWith<_GameUiState> get copyWith => __$GameUiStateCopyWithImpl<_GameUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameUiState&&(identical(other.banner, banner) || other.banner == banner)&&(identical(other.game, game) || other.game == game));
}


@override
int get hashCode => Object.hash(runtimeType,banner,game);

@override
String toString() {
  return 'GameUiState(banner: $banner, game: $game)';
}


}

/// @nodoc
abstract mixin class _$GameUiStateCopyWith<$Res> implements $GameUiStateCopyWith<$Res> {
  factory _$GameUiStateCopyWith(_GameUiState value, $Res Function(_GameUiState) _then) = __$GameUiStateCopyWithImpl;
@override @useResult
$Res call({
 StatusBanner banner, Game game
});


@override $StatusBannerCopyWith<$Res> get banner;@override $GameCopyWith<$Res> get game;

}
/// @nodoc
class __$GameUiStateCopyWithImpl<$Res>
    implements _$GameUiStateCopyWith<$Res> {
  __$GameUiStateCopyWithImpl(this._self, this._then);

  final _GameUiState _self;
  final $Res Function(_GameUiState) _then;

/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? banner = null,Object? game = null,}) {
  return _then(_GameUiState(
banner: null == banner ? _self.banner : banner // ignore: cast_nullable_to_non_nullable
as StatusBanner,game: null == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as Game,
  ));
}

/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusBannerCopyWith<$Res> get banner {
  
  return $StatusBannerCopyWith<$Res>(_self.banner, (value) {
    return _then(_self.copyWith(banner: value));
  });
}/// Create a copy of GameUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameCopyWith<$Res> get game {
  
  return $GameCopyWith<$Res>(_self.game, (value) {
    return _then(_self.copyWith(game: value));
  });
}
}

// dart format on
