// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppInfoTearOff {
  const _$AppInfoTearOff();

  _AppInfo call({required String appName, required String version}) {
    return _AppInfo(
      appName: appName,
      version: version,
    );
  }
}

/// @nodoc
const $AppInfo = _$AppInfoTearOff();

/// @nodoc
mixin _$AppInfo {
  String get appName => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppInfoCopyWith<AppInfo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppInfoCopyWith<$Res> {
  factory $AppInfoCopyWith(AppInfo value, $Res Function(AppInfo) then) =
      _$AppInfoCopyWithImpl<$Res>;
  $Res call({String appName, String version});
}

/// @nodoc
class _$AppInfoCopyWithImpl<$Res> implements $AppInfoCopyWith<$Res> {
  _$AppInfoCopyWithImpl(this._value, this._then);

  final AppInfo _value;
  // ignore: unused_field
  final $Res Function(AppInfo) _then;

  @override
  $Res call({
    Object? appName = freezed,
    Object? version = freezed,
  }) {
    return _then(_value.copyWith(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$AppInfoCopyWith<$Res> implements $AppInfoCopyWith<$Res> {
  factory _$AppInfoCopyWith(_AppInfo value, $Res Function(_AppInfo) then) =
      __$AppInfoCopyWithImpl<$Res>;
  @override
  $Res call({String appName, String version});
}

/// @nodoc
class __$AppInfoCopyWithImpl<$Res> extends _$AppInfoCopyWithImpl<$Res>
    implements _$AppInfoCopyWith<$Res> {
  __$AppInfoCopyWithImpl(_AppInfo _value, $Res Function(_AppInfo) _then)
      : super(_value, (v) => _then(v as _AppInfo));

  @override
  _AppInfo get _value => super._value as _AppInfo;

  @override
  $Res call({
    Object? appName = freezed,
    Object? version = freezed,
  }) {
    return _then(_AppInfo(
      appName: appName == freezed
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AppInfo implements _AppInfo {
  const _$_AppInfo({required this.appName, required this.version});

  @override
  final String appName;
  @override
  final String version;

  @override
  String toString() {
    return 'AppInfo(appName: $appName, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppInfo &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appName, version);

  @JsonKey(ignore: true)
  @override
  _$AppInfoCopyWith<_AppInfo> get copyWith =>
      __$AppInfoCopyWithImpl<_AppInfo>(this, _$identity);
}

abstract class _AppInfo implements AppInfo {
  const factory _AppInfo({required String appName, required String version}) =
      _$_AppInfo;

  @override
  String get appName;
  @override
  String get version;
  @override
  @JsonKey(ignore: true)
  _$AppInfoCopyWith<_AppInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
