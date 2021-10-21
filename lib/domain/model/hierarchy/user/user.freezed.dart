// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required UserId id,
      required Email email,
      required bool isEmailVerified,
      required PasswordProvider? passwordProvider,
      required GoogleProvider? googleProvider,
      required AppleProvider? appleProvider,
      required List<Workspace> workspaces}) {
    return _User(
      id: id,
      email: email,
      isEmailVerified: isEmailVerified,
      passwordProvider: passwordProvider,
      googleProvider: googleProvider,
      appleProvider: appleProvider,
      workspaces: workspaces,
    );
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  UserId get id => throw _privateConstructorUsedError;
  Email get email => throw _privateConstructorUsedError;
  bool get isEmailVerified => throw _privateConstructorUsedError;
  PasswordProvider? get passwordProvider => throw _privateConstructorUsedError;
  GoogleProvider? get googleProvider => throw _privateConstructorUsedError;
  AppleProvider? get appleProvider => throw _privateConstructorUsedError;
  List<Workspace> get workspaces => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {UserId id,
      Email email,
      bool isEmailVerified,
      PasswordProvider? passwordProvider,
      GoogleProvider? googleProvider,
      AppleProvider? appleProvider,
      List<Workspace> workspaces});

  $UserIdCopyWith<$Res> get id;
  $EmailCopyWith<$Res> get email;
  $PasswordProviderCopyWith<$Res>? get passwordProvider;
  $GoogleProviderCopyWith<$Res>? get googleProvider;
  $AppleProviderCopyWith<$Res>? get appleProvider;
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
    Object? email = freezed,
    Object? isEmailVerified = freezed,
    Object? passwordProvider = freezed,
    Object? googleProvider = freezed,
    Object? appleProvider = freezed,
    Object? workspaces = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      isEmailVerified: isEmailVerified == freezed
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordProvider: passwordProvider == freezed
          ? _value.passwordProvider
          : passwordProvider // ignore: cast_nullable_to_non_nullable
              as PasswordProvider?,
      googleProvider: googleProvider == freezed
          ? _value.googleProvider
          : googleProvider // ignore: cast_nullable_to_non_nullable
              as GoogleProvider?,
      appleProvider: appleProvider == freezed
          ? _value.appleProvider
          : appleProvider // ignore: cast_nullable_to_non_nullable
              as AppleProvider?,
      workspaces: workspaces == freezed
          ? _value.workspaces
          : workspaces // ignore: cast_nullable_to_non_nullable
              as List<Workspace>,
    ));
  }

  @override
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value));
    });
  }

  @override
  $PasswordProviderCopyWith<$Res>? get passwordProvider {
    if (_value.passwordProvider == null) {
      return null;
    }

    return $PasswordProviderCopyWith<$Res>(_value.passwordProvider!, (value) {
      return _then(_value.copyWith(passwordProvider: value));
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
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserId id,
      Email email,
      bool isEmailVerified,
      PasswordProvider? passwordProvider,
      GoogleProvider? googleProvider,
      AppleProvider? appleProvider,
      List<Workspace> workspaces});

  @override
  $UserIdCopyWith<$Res> get id;
  @override
  $EmailCopyWith<$Res> get email;
  @override
  $PasswordProviderCopyWith<$Res>? get passwordProvider;
  @override
  $GoogleProviderCopyWith<$Res>? get googleProvider;
  @override
  $AppleProviderCopyWith<$Res>? get appleProvider;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? isEmailVerified = freezed,
    Object? passwordProvider = freezed,
    Object? googleProvider = freezed,
    Object? appleProvider = freezed,
    Object? workspaces = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      isEmailVerified: isEmailVerified == freezed
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordProvider: passwordProvider == freezed
          ? _value.passwordProvider
          : passwordProvider // ignore: cast_nullable_to_non_nullable
              as PasswordProvider?,
      googleProvider: googleProvider == freezed
          ? _value.googleProvider
          : googleProvider // ignore: cast_nullable_to_non_nullable
              as GoogleProvider?,
      appleProvider: appleProvider == freezed
          ? _value.appleProvider
          : appleProvider // ignore: cast_nullable_to_non_nullable
              as AppleProvider?,
      workspaces: workspaces == freezed
          ? _value.workspaces
          : workspaces // ignore: cast_nullable_to_non_nullable
              as List<Workspace>,
    ));
  }
}

/// @nodoc

class _$_User extends _User {
  const _$_User(
      {required this.id,
      required this.email,
      required this.isEmailVerified,
      required this.passwordProvider,
      required this.googleProvider,
      required this.appleProvider,
      required this.workspaces})
      : super._();

  @override
  final UserId id;
  @override
  final Email email;
  @override
  final bool isEmailVerified;
  @override
  final PasswordProvider? passwordProvider;
  @override
  final GoogleProvider? googleProvider;
  @override
  final AppleProvider? appleProvider;
  @override
  final List<Workspace> workspaces;

  @override
  String toString() {
    return 'User(id: $id, email: $email, isEmailVerified: $isEmailVerified, passwordProvider: $passwordProvider, googleProvider: $googleProvider, appleProvider: $appleProvider, workspaces: $workspaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.passwordProvider, passwordProvider) ||
                other.passwordProvider == passwordProvider) &&
            (identical(other.googleProvider, googleProvider) ||
                other.googleProvider == googleProvider) &&
            (identical(other.appleProvider, appleProvider) ||
                other.appleProvider == appleProvider) &&
            const DeepCollectionEquality()
                .equals(other.workspaces, workspaces));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      isEmailVerified,
      passwordProvider,
      googleProvider,
      appleProvider,
      const DeepCollectionEquality().hash(workspaces));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);
}

abstract class _User extends User {
  const factory _User(
      {required UserId id,
      required Email email,
      required bool isEmailVerified,
      required PasswordProvider? passwordProvider,
      required GoogleProvider? googleProvider,
      required AppleProvider? appleProvider,
      required List<Workspace> workspaces}) = _$_User;
  const _User._() : super._();

  @override
  UserId get id;
  @override
  Email get email;
  @override
  bool get isEmailVerified;
  @override
  PasswordProvider? get passwordProvider;
  @override
  GoogleProvider? get googleProvider;
  @override
  AppleProvider? get appleProvider;
  @override
  List<Workspace> get workspaces;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
