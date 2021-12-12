// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return _UserResponse.fromJson(json);
}

/// @nodoc
class _$UserResponseTearOff {
  const _$UserResponseTearOff();

  _UserResponse call(
      {@JsonKey(name: 'id')
          required int id,
      @JsonKey(name: 'workspaces')
          required List<WorkspaceResponse> workspaces}) {
    return _UserResponse(
      id: id,
      workspaces: workspaces,
    );
  }

  UserResponse fromJson(Map<String, Object?> json) {
    return UserResponse.fromJson(json);
  }
}

/// @nodoc
const $UserResponse = _$UserResponseTearOff();

/// @nodoc
mixin _$UserResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'workspaces')
  List<WorkspaceResponse> get workspaces => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseCopyWith<UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseCopyWith<$Res> {
  factory $UserResponseCopyWith(
          UserResponse value, $Res Function(UserResponse) then) =
      _$UserResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'workspaces') List<WorkspaceResponse> workspaces});
}

/// @nodoc
class _$UserResponseCopyWithImpl<$Res> implements $UserResponseCopyWith<$Res> {
  _$UserResponseCopyWithImpl(this._value, this._then);

  final UserResponse _value;
  // ignore: unused_field
  final $Res Function(UserResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? workspaces = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workspaces: workspaces == freezed
          ? _value.workspaces
          : workspaces // ignore: cast_nullable_to_non_nullable
              as List<WorkspaceResponse>,
    ));
  }
}

/// @nodoc
abstract class _$UserResponseCopyWith<$Res>
    implements $UserResponseCopyWith<$Res> {
  factory _$UserResponseCopyWith(
          _UserResponse value, $Res Function(_UserResponse) then) =
      __$UserResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'workspaces') List<WorkspaceResponse> workspaces});
}

/// @nodoc
class __$UserResponseCopyWithImpl<$Res> extends _$UserResponseCopyWithImpl<$Res>
    implements _$UserResponseCopyWith<$Res> {
  __$UserResponseCopyWithImpl(
      _UserResponse _value, $Res Function(_UserResponse) _then)
      : super(_value, (v) => _then(v as _UserResponse));

  @override
  _UserResponse get _value => super._value as _UserResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? workspaces = freezed,
  }) {
    return _then(_UserResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workspaces: workspaces == freezed
          ? _value.workspaces
          : workspaces // ignore: cast_nullable_to_non_nullable
              as List<WorkspaceResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserResponse implements _UserResponse {
  const _$_UserResponse(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'workspaces') required this.workspaces});

  factory _$_UserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_UserResponseFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  final int id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'workspaces')
  final List<WorkspaceResponse> workspaces;

  @override
  String toString() {
    return 'UserResponse(id: $id, workspaces: $workspaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.workspaces, workspaces));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(workspaces));

  @JsonKey(ignore: true)
  @override
  _$UserResponseCopyWith<_UserResponse> get copyWith =>
      __$UserResponseCopyWithImpl<_UserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserResponseToJson(this);
  }
}

abstract class _UserResponse implements UserResponse {
  const factory _UserResponse(
      {@JsonKey(name: 'id')
          required int id,
      @JsonKey(name: 'workspaces')
          required List<WorkspaceResponse> workspaces}) = _$_UserResponse;

  factory _UserResponse.fromJson(Map<String, dynamic> json) =
      _$_UserResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'workspaces')
  List<WorkspaceResponse> get workspaces;
  @override
  @JsonKey(ignore: true)
  _$UserResponseCopyWith<_UserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
