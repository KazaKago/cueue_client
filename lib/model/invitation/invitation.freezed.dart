// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$InvitationCopyWithImpl<$Res, Invitation>;
  @useResult
  $Res call({InvitationCode code, Workspace workspace, DateTime expiredAt});

  $InvitationCodeCopyWith<$Res> get code;
  $WorkspaceCopyWith<$Res> get workspace;
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res, $Val extends Invitation>
    implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? workspace = null,
    Object? expiredAt = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as InvitationCode,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $InvitationCodeCopyWith<$Res> get code {
    return $InvitationCodeCopyWith<$Res>(_value.code, (value) {
      return _then(_value.copyWith(code: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkspaceCopyWith<$Res> get workspace {
    return $WorkspaceCopyWith<$Res>(_value.workspace, (value) {
      return _then(_value.copyWith(workspace: value) as $Val);
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
  @useResult
  $Res call({InvitationCode code, Workspace workspace, DateTime expiredAt});

  @override
  $InvitationCodeCopyWith<$Res> get code;
  @override
  $WorkspaceCopyWith<$Res> get workspace;
}

/// @nodoc
class __$$_InvitationCopyWithImpl<$Res>
    extends _$InvitationCopyWithImpl<$Res, _$_Invitation>
    implements _$$_InvitationCopyWith<$Res> {
  __$$_InvitationCopyWithImpl(
      _$_Invitation _value, $Res Function(_$_Invitation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? workspace = null,
    Object? expiredAt = null,
  }) {
    return _then(_$_Invitation(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as InvitationCode,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace,
      expiredAt: null == expiredAt
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
            (identical(other.code, code) || other.code == code) &&
            (identical(other.workspace, workspace) ||
                other.workspace == workspace) &&
            (identical(other.expiredAt, expiredAt) ||
                other.expiredAt == expiredAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, workspace, expiredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
