// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkspaceResponse _$WorkspaceResponseFromJson(Map<String, dynamic> json) {
  return _WorkspaceResponse.fromJson(json);
}

/// @nodoc
mixin _$WorkspaceResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'users')
  List<UserSummaryResponse> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceResponseCopyWith<WorkspaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceResponseCopyWith<$Res> {
  factory $WorkspaceResponseCopyWith(
          WorkspaceResponse value, $Res Function(WorkspaceResponse) then) =
      _$WorkspaceResponseCopyWithImpl<$Res, WorkspaceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'users') List<UserSummaryResponse> users});
}

/// @nodoc
class _$WorkspaceResponseCopyWithImpl<$Res, $Val extends WorkspaceResponse>
    implements $WorkspaceResponseCopyWith<$Res> {
  _$WorkspaceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserSummaryResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkspaceResponseImplCopyWith<$Res>
    implements $WorkspaceResponseCopyWith<$Res> {
  factory _$$WorkspaceResponseImplCopyWith(_$WorkspaceResponseImpl value,
          $Res Function(_$WorkspaceResponseImpl) then) =
      __$$WorkspaceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'users') List<UserSummaryResponse> users});
}

/// @nodoc
class __$$WorkspaceResponseImplCopyWithImpl<$Res>
    extends _$WorkspaceResponseCopyWithImpl<$Res, _$WorkspaceResponseImpl>
    implements _$$WorkspaceResponseImplCopyWith<$Res> {
  __$$WorkspaceResponseImplCopyWithImpl(_$WorkspaceResponseImpl _value,
      $Res Function(_$WorkspaceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? users = null,
  }) {
    return _then(_$WorkspaceResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserSummaryResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceResponseImpl implements _WorkspaceResponse {
  const _$WorkspaceResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'users') required final List<UserSummaryResponse> users})
      : _users = users;

  factory _$WorkspaceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceResponseImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'id')
  final int id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String name;
// ignore: invalid_annotation_target
  final List<UserSummaryResponse> _users;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'users')
  List<UserSummaryResponse> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'WorkspaceResponse(id: $id, name: $name, users: $users)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceResponseImplCopyWith<_$WorkspaceResponseImpl> get copyWith =>
      __$$WorkspaceResponseImplCopyWithImpl<_$WorkspaceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceResponseImplToJson(
      this,
    );
  }
}

abstract class _WorkspaceResponse implements WorkspaceResponse {
  const factory _WorkspaceResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'users')
          required final List<UserSummaryResponse> users}) =
      _$WorkspaceResponseImpl;

  factory _WorkspaceResponse.fromJson(Map<String, dynamic> json) =
      _$WorkspaceResponseImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'users')
  List<UserSummaryResponse> get users;
  @override
  @JsonKey(ignore: true)
  _$$WorkspaceResponseImplCopyWith<_$WorkspaceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
