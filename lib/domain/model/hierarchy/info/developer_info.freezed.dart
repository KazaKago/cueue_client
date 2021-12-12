// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'developer_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeveloperInfoTearOff {
  const _$DeveloperInfoTearOff();

  _DeveloperInfo call(
      {required String developer, required Uri webSite, required Email email}) {
    return _DeveloperInfo(
      developer: developer,
      webSite: webSite,
      email: email,
    );
  }
}

/// @nodoc
const $DeveloperInfo = _$DeveloperInfoTearOff();

/// @nodoc
mixin _$DeveloperInfo {
  String get developer => throw _privateConstructorUsedError;
  Uri get webSite => throw _privateConstructorUsedError;
  Email get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeveloperInfoCopyWith<DeveloperInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeveloperInfoCopyWith<$Res> {
  factory $DeveloperInfoCopyWith(
          DeveloperInfo value, $Res Function(DeveloperInfo) then) =
      _$DeveloperInfoCopyWithImpl<$Res>;
  $Res call({String developer, Uri webSite, Email email});

  $EmailCopyWith<$Res> get email;
}

/// @nodoc
class _$DeveloperInfoCopyWithImpl<$Res>
    implements $DeveloperInfoCopyWith<$Res> {
  _$DeveloperInfoCopyWithImpl(this._value, this._then);

  final DeveloperInfo _value;
  // ignore: unused_field
  final $Res Function(DeveloperInfo) _then;

  @override
  $Res call({
    Object? developer = freezed,
    Object? webSite = freezed,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      developer: developer == freezed
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String,
      webSite: webSite == freezed
          ? _value.webSite
          : webSite // ignore: cast_nullable_to_non_nullable
              as Uri,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
    ));
  }

  @override
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value));
    });
  }
}

/// @nodoc
abstract class _$DeveloperInfoCopyWith<$Res>
    implements $DeveloperInfoCopyWith<$Res> {
  factory _$DeveloperInfoCopyWith(
          _DeveloperInfo value, $Res Function(_DeveloperInfo) then) =
      __$DeveloperInfoCopyWithImpl<$Res>;
  @override
  $Res call({String developer, Uri webSite, Email email});

  @override
  $EmailCopyWith<$Res> get email;
}

/// @nodoc
class __$DeveloperInfoCopyWithImpl<$Res>
    extends _$DeveloperInfoCopyWithImpl<$Res>
    implements _$DeveloperInfoCopyWith<$Res> {
  __$DeveloperInfoCopyWithImpl(
      _DeveloperInfo _value, $Res Function(_DeveloperInfo) _then)
      : super(_value, (v) => _then(v as _DeveloperInfo));

  @override
  _DeveloperInfo get _value => super._value as _DeveloperInfo;

  @override
  $Res call({
    Object? developer = freezed,
    Object? webSite = freezed,
    Object? email = freezed,
  }) {
    return _then(_DeveloperInfo(
      developer: developer == freezed
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String,
      webSite: webSite == freezed
          ? _value.webSite
          : webSite // ignore: cast_nullable_to_non_nullable
              as Uri,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
    ));
  }
}

/// @nodoc

class _$_DeveloperInfo extends _DeveloperInfo {
  const _$_DeveloperInfo(
      {required this.developer, required this.webSite, required this.email})
      : super._();

  @override
  final String developer;
  @override
  final Uri webSite;
  @override
  final Email email;

  @override
  String toString() {
    return 'DeveloperInfo(developer: $developer, webSite: $webSite, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeveloperInfo &&
            const DeepCollectionEquality().equals(other.developer, developer) &&
            const DeepCollectionEquality().equals(other.webSite, webSite) &&
            const DeepCollectionEquality().equals(other.email, email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(developer),
      const DeepCollectionEquality().hash(webSite),
      const DeepCollectionEquality().hash(email));

  @JsonKey(ignore: true)
  @override
  _$DeveloperInfoCopyWith<_DeveloperInfo> get copyWith =>
      __$DeveloperInfoCopyWithImpl<_DeveloperInfo>(this, _$identity);
}

abstract class _DeveloperInfo extends DeveloperInfo {
  const factory _DeveloperInfo(
      {required String developer,
      required Uri webSite,
      required Email email}) = _$_DeveloperInfo;
  const _DeveloperInfo._() : super._();

  @override
  String get developer;
  @override
  Uri get webSite;
  @override
  Email get email;
  @override
  @JsonKey(ignore: true)
  _$DeveloperInfoCopyWith<_DeveloperInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
