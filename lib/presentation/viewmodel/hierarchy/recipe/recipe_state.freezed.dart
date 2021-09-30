// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecipeStateTearOff {
  const _$RecipeStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _LoadingWithValue loadingWithValue(List<RecipeSummary> recipes) {
    return _LoadingWithValue(
      recipes,
    );
  }

  _Completed completed(List<RecipeSummary> recipes) {
    return _Completed(
      recipes,
    );
  }

  _Error error(Exception error) {
    return _Error(
      error,
    );
  }

  _ErrorWithValue errorWithValue(List<RecipeSummary> recipes, Exception error) {
    return _ErrorWithValue(
      recipes,
      error,
    );
  }
}

/// @nodoc
const $RecipeState = _$RecipeStateTearOff();

/// @nodoc
mixin _$RecipeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<RecipeSummary> recipes) loadingWithValue,
    required TResult Function(List<RecipeSummary> recipes) completed,
    required TResult Function(Exception error) error,
    required TResult Function(List<RecipeSummary> recipes, Exception error)
        errorWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingWithValue value) loadingWithValue,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorWithValue value) errorWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeStateCopyWith<$Res> {
  factory $RecipeStateCopyWith(
          RecipeState value, $Res Function(RecipeState) then) =
      _$RecipeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecipeStateCopyWithImpl<$Res> implements $RecipeStateCopyWith<$Res> {
  _$RecipeStateCopyWithImpl(this._value, this._then);

  final RecipeState _value;
  // ignore: unused_field
  final $Res Function(RecipeState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
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
    return 'RecipeState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<RecipeSummary> recipes) loadingWithValue,
    required TResult Function(List<RecipeSummary> recipes) completed,
    required TResult Function(Exception error) error,
    required TResult Function(List<RecipeSummary> recipes, Exception error)
        errorWithValue,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
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
    required TResult Function(_LoadingWithValue value) loadingWithValue,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorWithValue value) errorWithValue,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RecipeState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadingWithValueCopyWith<$Res> {
  factory _$LoadingWithValueCopyWith(
          _LoadingWithValue value, $Res Function(_LoadingWithValue) then) =
      __$LoadingWithValueCopyWithImpl<$Res>;
  $Res call({List<RecipeSummary> recipes});
}

/// @nodoc
class __$LoadingWithValueCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$LoadingWithValueCopyWith<$Res> {
  __$LoadingWithValueCopyWithImpl(
      _LoadingWithValue _value, $Res Function(_LoadingWithValue) _then)
      : super(_value, (v) => _then(v as _LoadingWithValue));

  @override
  _LoadingWithValue get _value => super._value as _LoadingWithValue;

  @override
  $Res call({
    Object? recipes = freezed,
  }) {
    return _then(_LoadingWithValue(
      recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ));
  }
}

/// @nodoc

class _$_LoadingWithValue implements _LoadingWithValue {
  const _$_LoadingWithValue(this.recipes);

  @override
  final List<RecipeSummary> recipes;

  @override
  String toString() {
    return 'RecipeState.loadingWithValue(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoadingWithValue &&
            (identical(other.recipes, recipes) ||
                const DeepCollectionEquality().equals(other.recipes, recipes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(recipes);

  @JsonKey(ignore: true)
  @override
  _$LoadingWithValueCopyWith<_LoadingWithValue> get copyWith =>
      __$LoadingWithValueCopyWithImpl<_LoadingWithValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<RecipeSummary> recipes) loadingWithValue,
    required TResult Function(List<RecipeSummary> recipes) completed,
    required TResult Function(Exception error) error,
    required TResult Function(List<RecipeSummary> recipes, Exception error)
        errorWithValue,
  }) {
    return loadingWithValue(recipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
  }) {
    return loadingWithValue?.call(recipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
    required TResult orElse(),
  }) {
    if (loadingWithValue != null) {
      return loadingWithValue(recipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingWithValue value) loadingWithValue,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorWithValue value) errorWithValue,
  }) {
    return loadingWithValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
  }) {
    return loadingWithValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
    required TResult orElse(),
  }) {
    if (loadingWithValue != null) {
      return loadingWithValue(this);
    }
    return orElse();
  }
}

abstract class _LoadingWithValue implements RecipeState {
  const factory _LoadingWithValue(List<RecipeSummary> recipes) =
      _$_LoadingWithValue;

  List<RecipeSummary> get recipes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LoadingWithValueCopyWith<_LoadingWithValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$CompletedCopyWith<$Res> {
  factory _$CompletedCopyWith(
          _Completed value, $Res Function(_Completed) then) =
      __$CompletedCopyWithImpl<$Res>;
  $Res call({List<RecipeSummary> recipes});
}

/// @nodoc
class __$CompletedCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(_Completed _value, $Res Function(_Completed) _then)
      : super(_value, (v) => _then(v as _Completed));

  @override
  _Completed get _value => super._value as _Completed;

  @override
  $Res call({
    Object? recipes = freezed,
  }) {
    return _then(_Completed(
      recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ));
  }
}

/// @nodoc

class _$_Completed implements _Completed {
  const _$_Completed(this.recipes);

  @override
  final List<RecipeSummary> recipes;

  @override
  String toString() {
    return 'RecipeState.completed(recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Completed &&
            (identical(other.recipes, recipes) ||
                const DeepCollectionEquality().equals(other.recipes, recipes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(recipes);

  @JsonKey(ignore: true)
  @override
  _$CompletedCopyWith<_Completed> get copyWith =>
      __$CompletedCopyWithImpl<_Completed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<RecipeSummary> recipes) loadingWithValue,
    required TResult Function(List<RecipeSummary> recipes) completed,
    required TResult Function(Exception error) error,
    required TResult Function(List<RecipeSummary> recipes, Exception error)
        errorWithValue,
  }) {
    return completed(recipes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
  }) {
    return completed?.call(recipes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(recipes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingWithValue value) loadingWithValue,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorWithValue value) errorWithValue,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements RecipeState {
  const factory _Completed(List<RecipeSummary> recipes) = _$_Completed;

  List<RecipeSummary> get recipes => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CompletedCopyWith<_Completed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$RecipeStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_Error(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final Exception error;

  @override
  String toString() {
    return 'RecipeState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<RecipeSummary> recipes) loadingWithValue,
    required TResult Function(List<RecipeSummary> recipes) completed,
    required TResult Function(Exception error) error,
    required TResult Function(List<RecipeSummary> recipes, Exception error)
        errorWithValue,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingWithValue value) loadingWithValue,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorWithValue value) errorWithValue,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RecipeState {
  const factory _Error(Exception error) = _$_Error;

  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorWithValueCopyWith<$Res> {
  factory _$ErrorWithValueCopyWith(
          _ErrorWithValue value, $Res Function(_ErrorWithValue) then) =
      __$ErrorWithValueCopyWithImpl<$Res>;
  $Res call({List<RecipeSummary> recipes, Exception error});
}

/// @nodoc
class __$ErrorWithValueCopyWithImpl<$Res>
    extends _$RecipeStateCopyWithImpl<$Res>
    implements _$ErrorWithValueCopyWith<$Res> {
  __$ErrorWithValueCopyWithImpl(
      _ErrorWithValue _value, $Res Function(_ErrorWithValue) _then)
      : super(_value, (v) => _then(v as _ErrorWithValue));

  @override
  _ErrorWithValue get _value => super._value as _ErrorWithValue;

  @override
  $Res call({
    Object? recipes = freezed,
    Object? error = freezed,
  }) {
    return _then(_ErrorWithValue(
      recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$_ErrorWithValue implements _ErrorWithValue {
  const _$_ErrorWithValue(this.recipes, this.error);

  @override
  final List<RecipeSummary> recipes;
  @override
  final Exception error;

  @override
  String toString() {
    return 'RecipeState.errorWithValue(recipes: $recipes, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ErrorWithValue &&
            (identical(other.recipes, recipes) ||
                const DeepCollectionEquality()
                    .equals(other.recipes, recipes)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recipes) ^
      const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  _$ErrorWithValueCopyWith<_ErrorWithValue> get copyWith =>
      __$ErrorWithValueCopyWithImpl<_ErrorWithValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<RecipeSummary> recipes) loadingWithValue,
    required TResult Function(List<RecipeSummary> recipes) completed,
    required TResult Function(Exception error) error,
    required TResult Function(List<RecipeSummary> recipes, Exception error)
        errorWithValue,
  }) {
    return errorWithValue(recipes, this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
  }) {
    return errorWithValue?.call(recipes, this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<RecipeSummary> recipes)? loadingWithValue,
    TResult Function(List<RecipeSummary> recipes)? completed,
    TResult Function(Exception error)? error,
    TResult Function(List<RecipeSummary> recipes, Exception error)?
        errorWithValue,
    required TResult orElse(),
  }) {
    if (errorWithValue != null) {
      return errorWithValue(recipes, this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingWithValue value) loadingWithValue,
    required TResult Function(_Completed value) completed,
    required TResult Function(_Error value) error,
    required TResult Function(_ErrorWithValue value) errorWithValue,
  }) {
    return errorWithValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
  }) {
    return errorWithValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingWithValue value)? loadingWithValue,
    TResult Function(_Completed value)? completed,
    TResult Function(_Error value)? error,
    TResult Function(_ErrorWithValue value)? errorWithValue,
    required TResult orElse(),
  }) {
    if (errorWithValue != null) {
      return errorWithValue(this);
    }
    return orElse();
  }
}

abstract class _ErrorWithValue implements RecipeState {
  const factory _ErrorWithValue(List<RecipeSummary> recipes, Exception error) =
      _$_ErrorWithValue;

  List<RecipeSummary> get recipes => throw _privateConstructorUsedError;
  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ErrorWithValueCopyWith<_ErrorWithValue> get copyWith =>
      throw _privateConstructorUsedError;
}
