// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$RecipeIdCopyWithImpl<$Res, RecipeId>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class _$RecipeIdCopyWithImpl<$Res, $Val extends RecipeId>
    implements $RecipeIdCopyWith<$Res> {
  _$RecipeIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeIdCopyWith<$Res> implements $RecipeIdCopyWith<$Res> {
  factory _$$_RecipeIdCopyWith(
          _$_RecipeId value, $Res Function(_$_RecipeId) then) =
      __$$_RecipeIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$_RecipeIdCopyWithImpl<$Res>
    extends _$RecipeIdCopyWithImpl<$Res, _$_RecipeId>
    implements _$$_RecipeIdCopyWith<$Res> {
  __$$_RecipeIdCopyWithImpl(
      _$_RecipeId _value, $Res Function(_$_RecipeId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_RecipeId(
      null == value
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
            other is _$_RecipeId &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeIdCopyWith<_$_RecipeId> get copyWith =>
      __$$_RecipeIdCopyWithImpl<_$_RecipeId>(this, _$identity);
}

abstract class _RecipeId implements RecipeId {
  const factory _RecipeId(final int value) = _$_RecipeId;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeIdCopyWith<_$_RecipeId> get copyWith =>
      throw _privateConstructorUsedError;
}
