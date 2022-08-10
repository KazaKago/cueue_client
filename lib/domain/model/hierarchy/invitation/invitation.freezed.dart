// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invitation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Invitation {
  InvitationCode get code => throw _privateConstructorUsedError;
  Workspace get workspace => throw _privateConstructorUsedError;
  DateTime get expiredAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvitationCopyWith<Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCopyWith<$Res> {
  factory $InvitationCopyWith(
          Invitation value, $Res Function(Invitation) then) =
      _$InvitationCopyWithImpl<$Res>;
  $Res call({InvitationCode code, Workspace workspace, DateTime expiredAt});

  $InvitationCodeCopyWith<$Res> get code;
  $WorkspaceCopyWith<$Res> get workspace;
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res> implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  final Invitation _value;
  // ignore: unused_field
  final $Res Function(Invitation) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? workspace = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as InvitationCode,
      workspace: workspace == freezed
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace,
      expiredAt: expiredAt == freezed
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $InvitationCodeCopyWith<$Res> get code {
    return $InvitationCodeCopyWith<$Res>(_value.code, (value) {
      return _then(_value.copyWith(code: value));
    });
  }

  @override
  $WorkspaceCopyWith<$Res> get workspace {
    return $WorkspaceCopyWith<$Res>(_value.workspace, (value) {
      return _then(_value.copyWith(workspace: value));
    });
  }
}

/// @nodoc
abstract class _$$_InvitationCopyWith<$Res>
    implements $InvitationCopyWith<$Res> {
  factory _$$_InvitationCopyWith(
          _$_Invitation value, $Res Function(_$_Invitation) then) =
      __$$_InvitationCopyWithImpl<$Res>;
  @override
  $Res call({InvitationCode code, Workspace workspace, DateTime expiredAt});

  @override
  $InvitationCodeCopyWith<$Res> get code;
  @override
  $WorkspaceCopyWith<$Res> get workspace;
}

/// @nodoc
class __$$_InvitationCopyWithImpl<$Res> extends _$InvitationCopyWithImpl<$Res>
    implements _$$_InvitationCopyWith<$Res> {
  __$$_InvitationCopyWithImpl(
      _$_Invitation _value, $Res Function(_$_Invitation) _then)
      : super(_value, (v) => _then(v as _$_Invitation));

  @override
  _$_Invitation get _value => super._value as _$_Invitation;

  @override
  $Res call({
    Object? code = freezed,
    Object? workspace = freezed,
    Object? expiredAt = freezed,
  }) {
    return _then(_$_Invitation(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as InvitationCode,
      workspace: workspace == freezed
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace,
      expiredAt: expiredAt == freezed
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Invitation implements _Invitation {
  const _$_Invitation(
      {required this.code, required this.workspace, required this.expiredAt});

  @override
  final InvitationCode code;
  @override
  final Workspace workspace;
  @override
  final DateTime expiredAt;

  @override
  String toString() {
    return 'Invitation(code: $code, workspace: $workspace, expiredAt: $expiredAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Invitation &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.workspace, workspace) &&
            const DeepCollectionEquality().equals(other.expiredAt, expiredAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(workspace),
      const DeepCollectionEquality().hash(expiredAt));

  @JsonKey(ignore: true)
  @override
  _$$_InvitationCopyWith<_$_Invitation> get copyWith =>
      __$$_InvitationCopyWithImpl<_$_Invitation>(this, _$identity);
}

abstract class _Invitation implements Invitation {
  const factory _Invitation(
      {required final InvitationCode code,
      required final Workspace workspace,
      required final DateTime expiredAt}) = _$_Invitation;

  @override
  InvitationCode get code;
  @override
  Workspace get workspace;
  @override
  DateTime get expiredAt;
  @override
  @JsonKey(ignore: true)
  _$$_InvitationCopyWith<_$_Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}
