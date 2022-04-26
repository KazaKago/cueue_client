// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WorkspaceTearOff {
  const _$WorkspaceTearOff();

  _Workspace call({required WorkspaceId id, required String name}) {
    return _Workspace(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
const $Workspace = _$WorkspaceTearOff();

/// @nodoc
mixin _$Workspace {
  WorkspaceId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkspaceCopyWith<Workspace> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) = _$WorkspaceCopyWithImpl<$Res>;
  $Res call({WorkspaceId id, String name});

  $WorkspaceIdCopyWith<$Res> get id;
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res> implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  final Workspace _value;
  // ignore: unused_field
  final $Res Function(Workspace) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as WorkspaceId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $WorkspaceIdCopyWith<$Res> get id {
    return $WorkspaceIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$WorkspaceCopyWith(_Workspace value, $Res Function(_Workspace) then) = __$WorkspaceCopyWithImpl<$Res>;
  @override
  $Res call({WorkspaceId id, String name});

  @override
  $WorkspaceIdCopyWith<$Res> get id;
}

/// @nodoc
class __$WorkspaceCopyWithImpl<$Res> extends _$WorkspaceCopyWithImpl<$Res> implements _$WorkspaceCopyWith<$Res> {
  __$WorkspaceCopyWithImpl(_Workspace _value, $Res Function(_Workspace) _then) : super(_value, (v) => _then(v as _Workspace));

  @override
  _Workspace get _value => super._value as _Workspace;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Workspace(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as WorkspaceId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Workspace implements _Workspace {
  const _$_Workspace({required this.id, required this.name});

  @override
  final WorkspaceId id;
  @override
  final String name;

  @override
  String toString() {
    return 'Workspace(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Workspace && const DeepCollectionEquality().equals(other.id, id) && const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(id), const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$WorkspaceCopyWith<_Workspace> get copyWith => __$WorkspaceCopyWithImpl<_Workspace>(this, _$identity);
}

abstract class _Workspace implements Workspace {
  const factory _Workspace({required WorkspaceId id, required String name}) = _$_Workspace;

  @override
  WorkspaceId get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$WorkspaceCopyWith<_Workspace> get copyWith => throw _privateConstructorUsedError;
}
