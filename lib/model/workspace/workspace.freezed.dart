// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Workspace {
  WorkspaceId get id => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  List<UserSummary> get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) = _$WorkspaceCopyWithImpl<$Res, Workspace>;

  @useResult
  $Res call({WorkspaceId id, String name, List<UserSummary> users});

  $WorkspaceIdCopyWith<$Res> get id;
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res, $Val extends Workspace> implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

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
              as WorkspaceId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserSummary>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkspaceIdCopyWith<$Res> get id {
    return $WorkspaceIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$$_WorkspaceCopyWith(_$_Workspace value, $Res Function(_$_Workspace) then) = __$$_WorkspaceCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({WorkspaceId id, String name, List<UserSummary> users});

  @override
  $WorkspaceIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_WorkspaceCopyWithImpl<$Res> extends _$WorkspaceCopyWithImpl<$Res, _$_Workspace> implements _$$_WorkspaceCopyWith<$Res> {
  __$$_WorkspaceCopyWithImpl(_$_Workspace _value, $Res Function(_$_Workspace) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? users = null,
  }) {
    return _then(_$_Workspace(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as WorkspaceId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserSummary>,
    ));
  }
}

/// @nodoc

class _$_Workspace implements _Workspace {
  const _$_Workspace({required this.id, required this.name, required final List<UserSummary> users}) : _users = users;

  @override
  final WorkspaceId id;
  @override
  final String name;
  final List<UserSummary> _users;

  @override
  List<UserSummary> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Workspace && (identical(other.id, id) || other.id == id) && (identical(other.name, name) || other.name == name) && const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith => __$$_WorkspaceCopyWithImpl<_$_Workspace>(this, _$identity);
}

abstract class _Workspace implements Workspace {
  const factory _Workspace({required final WorkspaceId id, required final String name, required final List<UserSummary> users}) = _$_Workspace;

  @override
  WorkspaceId get id;

  @override
  String get name;

  @override
  List<UserSummary> get users;

  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith => throw _privateConstructorUsedError;
}
