// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  UserId get id => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  Uri? get photoUrl => throw _privateConstructorUsedError;
  GoogleProvider? get googleProvider => throw _privateConstructorUsedError;
  AppleProvider? get appleProvider => throw _privateConstructorUsedError;
  Workspace? get workspace => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {UserId id,
      String displayName,
      Uri? photoUrl,
      GoogleProvider? googleProvider,
      AppleProvider? appleProvider,
      Workspace? workspace});

  $UserIdCopyWith<$Res> get id;
  $GoogleProviderCopyWith<$Res>? get googleProvider;
  $AppleProviderCopyWith<$Res>? get appleProvider;
  $WorkspaceCopyWith<$Res>? get workspace;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? googleProvider = freezed,
    Object? appleProvider = freezed,
    Object? workspace = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as Uri?,
      googleProvider: googleProvider == freezed
          ? _value.googleProvider
          : googleProvider // ignore: cast_nullable_to_non_nullable
              as GoogleProvider?,
      appleProvider: appleProvider == freezed
          ? _value.appleProvider
          : appleProvider // ignore: cast_nullable_to_non_nullable
              as AppleProvider?,
      workspace: workspace == freezed
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace?,
    ));
  }

  @override
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $GoogleProviderCopyWith<$Res>? get googleProvider {
    if (_value.googleProvider == null) {
      return null;
    }

    return $GoogleProviderCopyWith<$Res>(_value.googleProvider!, (value) {
      return _then(_value.copyWith(googleProvider: value));
    });
  }

  @override
  $AppleProviderCopyWith<$Res>? get appleProvider {
    if (_value.appleProvider == null) {
      return null;
    }

    return $AppleProviderCopyWith<$Res>(_value.appleProvider!, (value) {
      return _then(_value.copyWith(appleProvider: value));
    });
  }

  @override
  $WorkspaceCopyWith<$Res>? get workspace {
    if (_value.workspace == null) {
      return null;
    }

    return $WorkspaceCopyWith<$Res>(_value.workspace!, (value) {
      return _then(_value.copyWith(workspace: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserId id,
      String displayName,
      Uri? photoUrl,
      GoogleProvider? googleProvider,
      AppleProvider? appleProvider,
      Workspace? workspace});

  @override
  $UserIdCopyWith<$Res> get id;
  @override
  $GoogleProviderCopyWith<$Res>? get googleProvider;
  @override
  $AppleProviderCopyWith<$Res>? get appleProvider;
  @override
  $WorkspaceCopyWith<$Res>? get workspace;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
    Object? googleProvider = freezed,
    Object? appleProvider = freezed,
    Object? workspace = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as Uri?,
      googleProvider: googleProvider == freezed
          ? _value.googleProvider
          : googleProvider // ignore: cast_nullable_to_non_nullable
              as GoogleProvider?,
      appleProvider: appleProvider == freezed
          ? _value.appleProvider
          : appleProvider // ignore: cast_nullable_to_non_nullable
              as AppleProvider?,
      workspace: workspace == freezed
          ? _value.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as Workspace?,
    ));
  }
}

/// @nodoc

class _$_User extends _User {
  const _$_User(
      {required this.id,
      required this.displayName,
      required this.photoUrl,
      required this.googleProvider,
      required this.appleProvider,
      required this.workspace})
      : super._();

  @override
  final UserId id;
  @override
  final String displayName;
  @override
  final Uri? photoUrl;
  @override
  final GoogleProvider? googleProvider;
  @override
  final AppleProvider? appleProvider;
  @override
  final Workspace? workspace;

  @override
  String toString() {
    return 'User(id: $id, displayName: $displayName, photoUrl: $photoUrl, googleProvider: $googleProvider, appleProvider: $appleProvider, workspace: $workspace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.displayName, displayName) &&
            const DeepCollectionEquality().equals(other.photoUrl, photoUrl) &&
            const DeepCollectionEquality()
                .equals(other.googleProvider, googleProvider) &&
            const DeepCollectionEquality()
                .equals(other.appleProvider, appleProvider) &&
            const DeepCollectionEquality().equals(other.workspace, workspace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(displayName),
      const DeepCollectionEquality().hash(photoUrl),
      const DeepCollectionEquality().hash(googleProvider),
      const DeepCollectionEquality().hash(appleProvider),
      const DeepCollectionEquality().hash(workspace));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required final UserId id,
      required final String displayName,
      required final Uri? photoUrl,
      required final GoogleProvider? googleProvider,
      required final AppleProvider? appleProvider,
      required final Workspace? workspace}) = _$_User;
  const _User._() : super._();

  @override
  UserId get id;
  @override
  String get displayName;
  @override
  Uri? get photoUrl;
  @override
  GoogleProvider? get googleProvider;
  @override
  AppleProvider? get appleProvider;
  @override
  Workspace? get workspace;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
