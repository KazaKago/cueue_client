// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WorkspaceIdTearOff {
  const _$WorkspaceIdTearOff();

  _WorkspaceId call(int value) {
    return _WorkspaceId(
      value,
    );
  }
}

/// @nodoc
const $WorkspaceId = _$WorkspaceIdTearOff();

/// @nodoc
mixin _$WorkspaceId {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkspaceIdCopyWith<WorkspaceId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceIdCopyWith<$Res> {
  factory $WorkspaceIdCopyWith(
          WorkspaceId value, $Res Function(WorkspaceId) then) =
      _$WorkspaceIdCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$WorkspaceIdCopyWithImpl<$Res> implements $WorkspaceIdCopyWith<$Res> {
  _$WorkspaceIdCopyWithImpl(this._value, this._then);

  final WorkspaceId _value;
  // ignore: unused_field
  final $Res Function(WorkspaceId) _then;

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
abstract class _$WorkspaceIdCopyWith<$Res>
    implements $WorkspaceIdCopyWith<$Res> {
  factory _$WorkspaceIdCopyWith(
          _WorkspaceId value, $Res Function(_WorkspaceId) then) =
      __$WorkspaceIdCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$WorkspaceIdCopyWithImpl<$Res> extends _$WorkspaceIdCopyWithImpl<$Res>
    implements _$WorkspaceIdCopyWith<$Res> {
  __$WorkspaceIdCopyWithImpl(
      _WorkspaceId _value, $Res Function(_WorkspaceId) _then)
      : super(_value, (v) => _then(v as _WorkspaceId));

  @override
  _WorkspaceId get _value => super._value as _WorkspaceId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_WorkspaceId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WorkspaceId implements _WorkspaceId {
  const _$_WorkspaceId(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'WorkspaceId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WorkspaceId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$WorkspaceIdCopyWith<_WorkspaceId> get copyWith =>
      __$WorkspaceIdCopyWithImpl<_WorkspaceId>(this, _$identity);
}

abstract class _WorkspaceId implements WorkspaceId {
  const factory _WorkspaceId(int value) = _$_WorkspaceId;

  @override
  int get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$WorkspaceIdCopyWith<_WorkspaceId> get copyWith =>
      throw _privateConstructorUsedError;
}
