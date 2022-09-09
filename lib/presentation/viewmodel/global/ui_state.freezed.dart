// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? value) loading,
    required TResult Function(T value) completed,
    required TResult Function(T? value, Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Completed<T> value) completed,
    required TResult Function(_Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiStateCopyWith<T, $Res> {
  factory $UiStateCopyWith(UiState<T> value, $Res Function(UiState<T>) then) =
      _$UiStateCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$UiStateCopyWithImpl<T, $Res> implements $UiStateCopyWith<T, $Res> {
  _$UiStateCopyWithImpl(this._value, this._then);

  final UiState<T> _value;
  // ignore: unused_field
  final $Res Function(UiState<T>) _then;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<T, $Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading<T> value, $Res Function(_$_Loading<T>) then) =
      __$$_LoadingCopyWithImpl<T, $Res>;
  $Res call({T? value});
}

/// @nodoc
class __$$_LoadingCopyWithImpl<T, $Res> extends _$UiStateCopyWithImpl<T, $Res>
    implements _$$_LoadingCopyWith<T, $Res> {
  __$$_LoadingCopyWithImpl(
      _$_Loading<T> _value, $Res Function(_$_Loading<T>) _then)
      : super(_value, (v) => _then(v as _$_Loading<T>));

  @override
  _$_Loading<T> get _value => super._value as _$_Loading<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Loading<T>(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Loading<T> extends _Loading<T> {
  const _$_Loading({this.value}) : super._();

  @override
  final T? value;

  @override
  String toString() {
    return 'UiState<$T>.loading(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loading<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_LoadingCopyWith<T, _$_Loading<T>> get copyWith =>
      __$$_LoadingCopyWithImpl<T, _$_Loading<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? value) loading,
    required TResult Function(T value) completed,
    required TResult Function(T? value, Exception error) error,
  }) {
    return loading(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
  }) {
    return loading?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Completed<T> value) completed,
    required TResult Function(_Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> extends UiState<T> {
  const factory _Loading({final T? value}) = _$_Loading<T>;
  const _Loading._() : super._();

  T? get value;
  @JsonKey(ignore: true)
  _$$_LoadingCopyWith<T, _$_Loading<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CompletedCopyWith<T, $Res> {
  factory _$$_CompletedCopyWith(
          _$_Completed<T> value, $Res Function(_$_Completed<T>) then) =
      __$$_CompletedCopyWithImpl<T, $Res>;
  $Res call({T value});
}

/// @nodoc
class __$$_CompletedCopyWithImpl<T, $Res> extends _$UiStateCopyWithImpl<T, $Res>
    implements _$$_CompletedCopyWith<T, $Res> {
  __$$_CompletedCopyWithImpl(
      _$_Completed<T> _value, $Res Function(_$_Completed<T>) _then)
      : super(_value, (v) => _then(v as _$_Completed<T>));

  @override
  _$_Completed<T> get _value => super._value as _$_Completed<T>;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Completed<T>(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Completed<T> extends _Completed<T> {
  const _$_Completed({required this.value}) : super._();

  @override
  final T value;

  @override
  String toString() {
    return 'UiState<$T>.completed(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Completed<T> &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_CompletedCopyWith<T, _$_Completed<T>> get copyWith =>
      __$$_CompletedCopyWithImpl<T, _$_Completed<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? value) loading,
    required TResult Function(T value) completed,
    required TResult Function(T? value, Exception error) error,
  }) {
    return completed(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
  }) {
    return completed?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Completed<T> value) completed,
    required TResult Function(_Error<T> value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed<T> extends UiState<T> {
  const factory _Completed({required final T value}) = _$_Completed<T>;
  const _Completed._() : super._();

  T get value;
  @JsonKey(ignore: true)
  _$$_CompletedCopyWith<T, _$_Completed<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<T, $Res> {
  factory _$$_ErrorCopyWith(
          _$_Error<T> value, $Res Function(_$_Error<T>) then) =
      __$$_ErrorCopyWithImpl<T, $Res>;
  $Res call({T? value, Exception error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<T, $Res> extends _$UiStateCopyWithImpl<T, $Res>
    implements _$$_ErrorCopyWith<T, $Res> {
  __$$_ErrorCopyWithImpl(_$_Error<T> _value, $Res Function(_$_Error<T>) _then)
      : super(_value, (v) => _then(v as _$_Error<T>));

  @override
  _$_Error<T> get _value => super._value as _$_Error<T>;

  @override
  $Res call({
    Object? value = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_Error<T>(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as T?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error<T> extends _Error<T> {
  const _$_Error({this.value, required this.error}) : super._();

  @override
  final T? value;
  @override
  final Exception error;

  @override
  String toString() {
    return 'UiState<$T>.error(value: $value, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error<T> &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      __$$_ErrorCopyWithImpl<T, _$_Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T? value) loading,
    required TResult Function(T value) completed,
    required TResult Function(T? value, Exception error) error,
  }) {
    return error(value, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
  }) {
    return error?.call(value, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T? value)? loading,
    TResult Function(T value)? completed,
    TResult Function(T? value, Exception error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(value, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading<T> value) loading,
    required TResult Function(_Completed<T> value) completed,
    required TResult Function(_Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading<T> value)? loading,
    TResult Function(_Completed<T> value)? completed,
    TResult Function(_Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error<T> extends UiState<T> {
  const factory _Error({final T? value, required final Exception error}) =
      _$_Error<T>;
  const _Error._() : super._();

  T? get value;
  Exception get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<T, _$_Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
