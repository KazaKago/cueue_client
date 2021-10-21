// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecipeIdTearOff {
  const _$RecipeIdTearOff();

  _RecipeId call(int value) {
    return _RecipeId(
      value,
    );
  }
}

/// @nodoc
const $RecipeId = _$RecipeIdTearOff();

/// @nodoc
mixin _$RecipeId {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeIdCopyWith<RecipeId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeIdCopyWith<$Res> {
  factory $RecipeIdCopyWith(RecipeId value, $Res Function(RecipeId) then) =
      _$RecipeIdCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$RecipeIdCopyWithImpl<$Res> implements $RecipeIdCopyWith<$Res> {
  _$RecipeIdCopyWithImpl(this._value, this._then);

  final RecipeId _value;
  // ignore: unused_field
  final $Res Function(RecipeId) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$RecipeIdCopyWith<$Res> implements $RecipeIdCopyWith<$Res> {
  factory _$RecipeIdCopyWith(_RecipeId value, $Res Function(_RecipeId) then) =
      __$RecipeIdCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$RecipeIdCopyWithImpl<$Res> extends _$RecipeIdCopyWithImpl<$Res>
    implements _$RecipeIdCopyWith<$Res> {
  __$RecipeIdCopyWithImpl(_RecipeId _value, $Res Function(_RecipeId) _then)
      : super(_value, (v) => _then(v as _RecipeId));

  @override
  _RecipeId get _value => super._value as _RecipeId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_RecipeId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RecipeId implements _RecipeId {
  const _$_RecipeId(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'RecipeId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeId &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  _$RecipeIdCopyWith<_RecipeId> get copyWith =>
      __$RecipeIdCopyWithImpl<_RecipeId>(this, _$identity);
}

abstract class _RecipeId implements RecipeId {
  const factory _RecipeId(int value) = _$_RecipeId;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$RecipeIdCopyWith<_RecipeId> get copyWith =>
      throw _privateConstructorUsedError;
}
