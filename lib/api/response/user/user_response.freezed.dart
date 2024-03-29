// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
mixin _$UserResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'display_name')
  String get displayName =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'photo')
  ContentResponse? get photo =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'workspace')
  WorkspaceResponse? get workspace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res, UserResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'photo') ContentResponse? photo,
      @JsonKey(name: 'workspace') WorkspaceResponse? workspace});

  $ContentResponseCopyWith<$Res>? get photo;
  $WorkspaceResponseCopyWith<$Res>? get workspace;
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res, $Val extends UserResponse>
    implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? photo = freezed,
    Object? workspace = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
      workspace: freezed == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as WorkspaceResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentResponseCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $ContentResponseCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkspaceResponseCopyWith<$Res>? get workspace {
    if (_value.workspace == null) {
      return null;
    }

    return $WorkspaceResponseCopyWith<$Res>(_value.workspace!, (value) {
      return _then(_value.copyWith(workspace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResponseImplCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$$UserResponseImplCopyWith(
          _$UserResponseImpl value, $Res Function(_$UserResponseImpl) then) =
      __$$UserResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'photo') ContentResponse? photo,
      @JsonKey(name: 'workspace') WorkspaceResponse? workspace});

  @override
  $ContentResponseCopyWith<$Res>? get photo;
  @override
  $WorkspaceResponseCopyWith<$Res>? get workspace;
}

/// @nodoc
class __$$UserResponseImplCopyWithImpl<$Res>
    extends _$UserResponseCopyWithImpl<$Res, _$UserResponseImpl>
    implements _$$UserResponseImplCopyWith<$Res> {
  __$$UserResponseImplCopyWithImpl(
      _$UserResponseImpl _value, $Res Function(_$UserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? photo = freezed,
    Object? workspace = freezed,
  }) {
    return _then(_$UserResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
      workspace: freezed == workspace
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as WorkspaceResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseImpl implements _UserResponse {
  const _$UserResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'display_name') required this.displayName,
      @JsonKey(name: 'photo') required this.photo,
      @JsonKey(name: 'workspace') required this.workspace});

  factory _$UserResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'id')
  final int id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'photo')
  final ContentResponse? photo;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'workspace')
  final WorkspaceResponse? workspace;

  @override
  String toString() {
    return 'UserResponse(id: $id, displayName: $displayName, photo: $photo, workspace: $workspace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.workspace, workspace) ||
                other.workspace == workspace));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, displayName, photo, workspace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      __$$UserResponseImplCopyWithImpl<_$UserResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseImplToJson(
      this,
    );
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'display_name') required final String displayName,
      @JsonKey(name: 'photo') required final ContentResponse? photo,
      @JsonKey(name: 'workspace')
      required final WorkspaceResponse? workspace}) = _$UserResponseImpl;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$UserResponseImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'display_name')
  String get displayName;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'photo')
  ContentResponse? get photo;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'workspace')
  WorkspaceResponse? get workspace;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseImplCopyWith<_$UserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
