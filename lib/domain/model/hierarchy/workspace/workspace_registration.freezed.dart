// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkspaceRegistration {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkspaceRegistrationCopyWith<WorkspaceRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceRegistrationCopyWith<$Res> {
  factory $WorkspaceRegistrationCopyWith(WorkspaceRegistration value,
          $Res Function(WorkspaceRegistration) then) =
      _$WorkspaceRegistrationCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$WorkspaceRegistrationCopyWithImpl<$Res>
    implements $WorkspaceRegistrationCopyWith<$Res> {
  _$WorkspaceRegistrationCopyWithImpl(this._value, this._then);

  final WorkspaceRegistration _value;
  // ignore: unused_field
  final $Res Function(WorkspaceRegistration) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkspaceRegistrationCopyWith<$Res>
    implements $WorkspaceRegistrationCopyWith<$Res> {
  factory _$$_WorkspaceRegistrationCopyWith(_$_WorkspaceRegistration value,
          $Res Function(_$_WorkspaceRegistration) then) =
      __$$_WorkspaceRegistrationCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$$_WorkspaceRegistrationCopyWithImpl<$Res>
    extends _$WorkspaceRegistrationCopyWithImpl<$Res>
    implements _$$_WorkspaceRegistrationCopyWith<$Res> {
  __$$_WorkspaceRegistrationCopyWithImpl(_$_WorkspaceRegistration _value,
      $Res Function(_$_WorkspaceRegistration) _then)
      : super(_value, (v) => _then(v as _$_WorkspaceRegistration));

  @override
  _$_WorkspaceRegistration get _value =>
      super._value as _$_WorkspaceRegistration;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_WorkspaceRegistration(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WorkspaceRegistration implements _WorkspaceRegistration {
  const _$_WorkspaceRegistration({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'WorkspaceRegistration(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkspaceRegistration &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_WorkspaceRegistrationCopyWith<_$_WorkspaceRegistration> get copyWith =>
      __$$_WorkspaceRegistrationCopyWithImpl<_$_WorkspaceRegistration>(
          this, _$identity);
}

abstract class _WorkspaceRegistration implements WorkspaceRegistration {
  const factory _WorkspaceRegistration({required final String name}) =
      _$_WorkspaceRegistration;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceRegistrationCopyWith<_$_WorkspaceRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
