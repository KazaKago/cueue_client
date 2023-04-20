// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppInfo {
  String get appName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  Uri get webSite => throw _privateConstructorUsedError;
  Uri get storeLink => throw _privateConstructorUsedError;
  String get developer => throw _privateConstructorUsedError;
  Email get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppInfoCopyWith<AppInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoCopyWith<$Res> {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) then) =
      _$AppInfoCopyWithImpl<$Res, AppInfo>;
  @useResult
  $Res call(
      {String appName,
      String version,
      Uri webSite,
      Uri storeLink,
      String developer,
      Email email});

  $EmailCopyWith<$Res> get email;
}

/// @nodoc
class _$AppInfoCopyWithImpl<$Res, $Val extends AppInfo>
    implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? version = null,
    Object? webSite = null,
    Object? storeLink = null,
    Object? developer = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      webSite: null == webSite
          ? _value.webSite
          : webSite // ignore: cast_nullable_to_non_nullable
              as Uri,
      storeLink: null == storeLink
          ? _value.storeLink
          : storeLink // ignore: cast_nullable_to_non_nullable
              as Uri,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EmailCopyWith<$Res> get email {
    return $EmailCopyWith<$Res>(_value.email, (value) {
      return _then(_value.copyWith(email: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$$_AppInfoCopyWith(
          _$_AppInfo value, $Res Function(_$_AppInfo) then) =
      __$$_AppInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String appName,
      String version,
      Uri webSite,
      Uri storeLink,
      String developer,
      Email email});

  @override
  $EmailCopyWith<$Res> get email;
}

/// @nodoc
class __$$_AppInfoCopyWithImpl<$Res>
    extends _$AppInfoCopyWithImpl<$Res, _$_AppInfo>
    implements _$$_AppInfoCopyWith<$Res> {
  __$$_AppInfoCopyWithImpl(_$_AppInfo _value, $Res Function(_$_AppInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? version = null,
    Object? webSite = null,
    Object? storeLink = null,
    Object? developer = null,
    Object? email = null,
  }) {
    return _then(_$_AppInfo(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      webSite: null == webSite
          ? _value.webSite
          : webSite // ignore: cast_nullable_to_non_nullable
              as Uri,
      storeLink: null == storeLink
          ? _value.storeLink
          : storeLink // ignore: cast_nullable_to_non_nullable
              as Uri,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
    ));
  }
}

/// @nodoc

class _$_AppInfo extends _AppInfo {
  const _$_AppInfo(
      {required this.appName,
      required this.version,
      required this.webSite,
      required this.storeLink,
      required this.developer,
      required this.email})
      : super._();

  @override
  final String appName;
  @override
  final String version;
  @override
  final Uri webSite;
  @override
  final Uri storeLink;
  @override
  final String developer;
  @override
  final Email email;

  @override
  String toString() {
    return 'AppInfo(appName: $appName, version: $version, webSite: $webSite, storeLink: $storeLink, developer: $developer, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppInfo &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.webSite, webSite) || other.webSite == webSite) &&
            (identical(other.storeLink, storeLink) ||
                other.storeLink == storeLink) &&
            (identical(other.developer, developer) ||
                other.developer == developer) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, appName, version, webSite, storeLink, developer, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppInfoCopyWith<_$_AppInfo> get copyWith =>
      __$$_AppInfoCopyWithImpl<_$_AppInfo>(this, _$identity);
}

abstract class _AppInfo extends AppInfo {
  const factory _AppInfo(
      {required final String appName,
      required final String version,
      required final Uri webSite,
      required final Uri storeLink,
      required final String developer,
      required final Email email}) = _$_AppInfo;
  const _AppInfo._() : super._();

  @override
  String get appName;
  @override
  String get version;
  @override
  Uri get webSite;
  @override
  Uri get storeLink;
  @override
  String get developer;
  @override
  Email get email;
  @override
  @JsonKey(ignore: true)
  _$$_AppInfoCopyWith<_$_AppInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
