// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Workspace {
  String get name => throw _privateConstructorUsedError;
  List<UserSummary> get users => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res>;
  $Res call({String name, List<UserSummary> users});
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res> implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  final Workspace _value;
  // ignore: unused_field
  final $Res Function(Workspace) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? users = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserSummary>,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$$_WorkspaceCopyWith(
          _$_Workspace value, $Res Function(_$_Workspace) then) =
      __$$_WorkspaceCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<UserSummary> users});
}

/// @nodoc
class __$$_WorkspaceCopyWithImpl<$Res> extends _$WorkspaceCopyWithImpl<$Res>
    implements _$$_WorkspaceCopyWith<$Res> {
  __$$_WorkspaceCopyWithImpl(
      _$_Workspace _value, $Res Function(_$_Workspace) _then)
      : super(_value, (v) => _then(v as _$_Workspace));

  @override
  _$_Workspace get _value => super._value as _$_Workspace;

  @override
  $Res call({
    Object? name = freezed,
    Object? users = freezed,
  }) {
    return _then(_$_Workspace(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      users: users == freezed
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserSummary>,
    ));
  }
}

/// @nodoc

class _$_Workspace implements _Workspace {
  const _$_Workspace(
      {required this.name, required final List<UserSummary> users})
      : _users = users;

  @override
  final String name;
  final List<UserSummary> _users;
  @override
  List<UserSummary> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'Workspace(name: $name, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Workspace &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith =>
      __$$_WorkspaceCopyWithImpl<_$_Workspace>(this, _$identity);
}

abstract class _Workspace implements Workspace {
  const factory _Workspace(
      {required final String name,
      required final List<UserSummary> users}) = _$_Workspace;

  @override
  String get name;
  @override
  List<UserSummary> get users;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceCopyWith<_$_Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}
