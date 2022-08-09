// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_WorkspaceIdCopyWith<$Res>
    implements $WorkspaceIdCopyWith<$Res> {
  factory _$$_WorkspaceIdCopyWith(
          _$_WorkspaceId value, $Res Function(_$_WorkspaceId) then) =
      __$$_WorkspaceIdCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$$_WorkspaceIdCopyWithImpl<$Res> extends _$WorkspaceIdCopyWithImpl<$Res>
    implements _$$_WorkspaceIdCopyWith<$Res> {
  __$$_WorkspaceIdCopyWithImpl(
      _$_WorkspaceId _value, $Res Function(_$_WorkspaceId) _then)
      : super(_value, (v) => _then(v as _$_WorkspaceId));

  @override
  _$_WorkspaceId get _value => super._value as _$_WorkspaceId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_WorkspaceId(
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
        (other.runtimeType == runtimeType &&
            other is _$_WorkspaceId &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_WorkspaceIdCopyWith<_$_WorkspaceId> get copyWith =>
      __$$_WorkspaceIdCopyWithImpl<_$_WorkspaceId>(this, _$identity);
}

abstract class _WorkspaceId implements WorkspaceId {
  const factory _WorkspaceId(final int value) = _$_WorkspaceId;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceIdCopyWith<_$_WorkspaceId> get copyWith =>
      throw _privateConstructorUsedError;
}
