// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'about_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AboutStateTearOff {
  const _$AboutStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Completed completed(AppInfo appInfo, DeveloperInfo developerInfo) {
    return _Completed(
      appInfo,
      developerInfo,
    );
  }
}

/// @nodoc
const $AboutState = _$AboutStateTearOff();

/// @nodoc
mixin _$AboutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)
        completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Completed value) completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Completed value)? completed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutStateCopyWith<$Res> {
  factory $AboutStateCopyWith(
          AboutState value, $Res Function(AboutState) then) =
      _$AboutStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AboutStateCopyWithImpl<$Res> implements $AboutStateCopyWith<$Res> {
  _$AboutStateCopyWithImpl(this._value, this._then);

  final AboutState _value;
  // ignore: unused_field
  final $Res Function(AboutState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$AboutStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AboutState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)
        completed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)? completed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Completed value) completed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Completed value)? completed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AboutState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$CompletedCopyWith<$Res> {
  factory _$CompletedCopyWith(
          _Completed value, $Res Function(_Completed) then) =
      __$CompletedCopyWithImpl<$Res>;
  $Res call({AppInfo appInfo, DeveloperInfo developerInfo});

  $AppInfoCopyWith<$Res> get appInfo;
  $DeveloperInfoCopyWith<$Res> get developerInfo;
}

/// @nodoc
class __$CompletedCopyWithImpl<$Res> extends _$AboutStateCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(_Completed _value, $Res Function(_Completed) _then)
      : super(_value, (v) => _then(v as _Completed));

  @override
  _Completed get _value => super._value as _Completed;

  @override
  $Res call({
    Object? appInfo = freezed,
    Object? developerInfo = freezed,
  }) {
    return _then(_Completed(
      appInfo == freezed
          ? _value.appInfo
          : appInfo // ignore: cast_nullable_to_non_nullable
              as AppInfo,
      developerInfo == freezed
          ? _value.developerInfo
          : developerInfo // ignore: cast_nullable_to_non_nullable
              as DeveloperInfo,
    ));
  }

  @override
  $AppInfoCopyWith<$Res> get appInfo {
    return $AppInfoCopyWith<$Res>(_value.appInfo, (value) {
      return _then(_value.copyWith(appInfo: value));
    });
  }

  @override
  $DeveloperInfoCopyWith<$Res> get developerInfo {
    return $DeveloperInfoCopyWith<$Res>(_value.developerInfo, (value) {
      return _then(_value.copyWith(developerInfo: value));
    });
  }
}

/// @nodoc

class _$_Completed implements _Completed {
  const _$_Completed(this.appInfo, this.developerInfo);

  @override
  final AppInfo appInfo;
  @override
  final DeveloperInfo developerInfo;

  @override
  String toString() {
    return 'AboutState.completed(appInfo: $appInfo, developerInfo: $developerInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Completed &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo) &&
            (identical(other.developerInfo, developerInfo) ||
                other.developerInfo == developerInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appInfo, developerInfo);

  @JsonKey(ignore: true)
  @override
  _$CompletedCopyWith<_Completed> get copyWith =>
      __$CompletedCopyWithImpl<_Completed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)
        completed,
  }) {
    return completed(appInfo, developerInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)? completed,
  }) {
    return completed?.call(appInfo, developerInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(AppInfo appInfo, DeveloperInfo developerInfo)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(appInfo, developerInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Completed value) completed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Completed value)? completed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Completed value)? completed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements AboutState {
  const factory _Completed(AppInfo appInfo, DeveloperInfo developerInfo) =
      _$_Completed;

  AppInfo get appInfo;
  DeveloperInfo get developerInfo;
  @JsonKey(ignore: true)
  _$CompletedCopyWith<_Completed> get copyWith =>
      throw _privateConstructorUsedError;
}
