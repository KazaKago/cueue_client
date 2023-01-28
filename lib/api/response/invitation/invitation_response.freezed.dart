// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvitationResponse _$InvitationResponseFromJson(Map<String, dynamic> json) {
  return _InvitationResponse.fromJson(json);
}

/// @nodoc
mixin _$InvitationResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'workspace')
  WorkspaceResponse get workspace => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'expire_at')
  String get expiredAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvitationResponseCopyWith<InvitationResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationResponseCopyWith<$Res> {
  factory $InvitationResponseCopyWith(InvitationResponse value, $Res Function(InvitationResponse) then) = _$InvitationResponseCopyWithImpl<$Res, InvitationResponse>;

  @useResult
  $Res call({@JsonKey(name: 'code') String code, @JsonKey(name: 'workspace') WorkspaceResponse workspace, @JsonKey(name: 'expire_at') String expiredAt});

  $WorkspaceResponseCopyWith<$Res> get workspace;
}

/// @nodoc
class _$InvitationResponseCopyWithImpl<$Res, $Val extends InvitationResponse> implements $InvitationResponseCopyWith<$Res> {
  _$InvitationResponseCopyWithImpl(this._value, this._then);

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
              as String,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as WorkspaceResponse,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkspaceResponseCopyWith<$Res> get workspace {
    return $WorkspaceResponseCopyWith<$Res>(_value.workspace, (value) {
      return _then(_value.copyWith(workspace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InvitationResponseCopyWith<$Res> implements $InvitationResponseCopyWith<$Res> {
  factory _$$_InvitationResponseCopyWith(_$_InvitationResponse value, $Res Function(_$_InvitationResponse) then) = __$$_InvitationResponseCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({@JsonKey(name: 'code') String code, @JsonKey(name: 'workspace') WorkspaceResponse workspace, @JsonKey(name: 'expire_at') String expiredAt});

  @override
  $WorkspaceResponseCopyWith<$Res> get workspace;
}

/// @nodoc
class __$$_InvitationResponseCopyWithImpl<$Res> extends _$InvitationResponseCopyWithImpl<$Res, _$_InvitationResponse> implements _$$_InvitationResponseCopyWith<$Res> {
  __$$_InvitationResponseCopyWithImpl(_$_InvitationResponse _value, $Res Function(_$_InvitationResponse) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? workspace = null,
    Object? expiredAt = null,
  }) {
    return _then(_$_InvitationResponse(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      workspace: null == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as WorkspaceResponse,
      expiredAt: null == expiredAt
          ? _value.expiredAt
          : expiredAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvitationResponse implements _InvitationResponse {
  const _$_InvitationResponse({@JsonKey(name: 'code') required this.code, @JsonKey(name: 'workspace') required this.workspace, @JsonKey(name: 'expire_at') required this.expiredAt});

  factory _$_InvitationResponse.fromJson(Map<String, dynamic> json) => _$$_InvitationResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'code')
  final String code;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'workspace')
  final WorkspaceResponse workspace;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'expire_at')
  final String expiredAt;

  @override
  String toString() {
    return 'InvitationResponse(code: $code, workspace: $workspace, expiredAt: $expiredAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_InvitationResponse && (identical(other.code, code) || other.code == code) && (identical(other.workspace, workspace) || other.workspace == workspace) && (identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, workspace, expiredAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvitationResponseCopyWith<_$_InvitationResponse> get copyWith => __$$_InvitationResponseCopyWithImpl<_$_InvitationResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvitationResponseToJson(
      this,
    );
  }
}

abstract class _InvitationResponse implements InvitationResponse {
  const factory _InvitationResponse({@JsonKey(name: 'code') required final String code, @JsonKey(name: 'workspace') required final WorkspaceResponse workspace, @JsonKey(name: 'expire_at') required final String expiredAt}) = _$_InvitationResponse;

  factory _InvitationResponse.fromJson(Map<String, dynamic> json) = _$_InvitationResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'code')
  String get code;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'workspace')
  WorkspaceResponse get workspace;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'expire_at')
  String get expiredAt;

  @override
  @JsonKey(ignore: true)
  _$$_InvitationResponseCopyWith<_$_InvitationResponse> get copyWith => throw _privateConstructorUsedError;
}
