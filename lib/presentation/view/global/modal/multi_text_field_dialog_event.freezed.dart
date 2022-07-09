// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'multi_text_field_dialog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MultiTextFieldDialogEvent {
  List<MultiTextFieldDialogResult> get results =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiTextFieldDialogResult> results)
        positive,
    required TResult Function(List<MultiTextFieldDialogResult> results) neutral,
    required TResult Function(List<MultiTextFieldDialogResult> results)
        negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Positive value) positive,
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Negative value) negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MultiTextFieldDialogEventCopyWith<MultiTextFieldDialogEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiTextFieldDialogEventCopyWith<$Res> {
  factory $MultiTextFieldDialogEventCopyWith(MultiTextFieldDialogEvent value,
          $Res Function(MultiTextFieldDialogEvent) then) =
      _$MultiTextFieldDialogEventCopyWithImpl<$Res>;
  $Res call({List<MultiTextFieldDialogResult> results});
}

/// @nodoc
class _$MultiTextFieldDialogEventCopyWithImpl<$Res>
    implements $MultiTextFieldDialogEventCopyWith<$Res> {
  _$MultiTextFieldDialogEventCopyWithImpl(this._value, this._then);

  final MultiTextFieldDialogEvent _value;
  // ignore: unused_field
  final $Res Function(MultiTextFieldDialogEvent) _then;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MultiTextFieldDialogResult>,
    ));
  }
}

/// @nodoc
abstract class _$$_PositiveCopyWith<$Res>
    implements $MultiTextFieldDialogEventCopyWith<$Res> {
  factory _$$_PositiveCopyWith(
          _$_Positive value, $Res Function(_$_Positive) then) =
      __$$_PositiveCopyWithImpl<$Res>;
  @override
  $Res call({List<MultiTextFieldDialogResult> results});
}

/// @nodoc
class __$$_PositiveCopyWithImpl<$Res>
    extends _$MultiTextFieldDialogEventCopyWithImpl<$Res>
    implements _$$_PositiveCopyWith<$Res> {
  __$$_PositiveCopyWithImpl(
      _$_Positive _value, $Res Function(_$_Positive) _then)
      : super(_value, (v) => _then(v as _$_Positive));

  @override
  _$_Positive get _value => super._value as _$_Positive;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$_Positive(
      results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MultiTextFieldDialogResult>,
    ));
  }
}

/// @nodoc

class _$_Positive implements _Positive {
  const _$_Positive(final List<MultiTextFieldDialogResult> results)
      : _results = results;

  final List<MultiTextFieldDialogResult> _results;
  @override
  List<MultiTextFieldDialogResult> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MultiTextFieldDialogEvent.positive(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Positive &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_PositiveCopyWith<_$_Positive> get copyWith =>
      __$$_PositiveCopyWithImpl<_$_Positive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiTextFieldDialogResult> results)
        positive,
    required TResult Function(List<MultiTextFieldDialogResult> results) neutral,
    required TResult Function(List<MultiTextFieldDialogResult> results)
        negative,
  }) {
    return positive(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
  }) {
    return positive?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
    required TResult orElse(),
  }) {
    if (positive != null) {
      return positive(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Positive value) positive,
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Negative value) negative,
  }) {
    return positive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
  }) {
    return positive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
    required TResult orElse(),
  }) {
    if (positive != null) {
      return positive(this);
    }
    return orElse();
  }
}

abstract class _Positive implements MultiTextFieldDialogEvent {
  const factory _Positive(final List<MultiTextFieldDialogResult> results) =
      _$_Positive;

  @override
  List<MultiTextFieldDialogResult> get results;
  @override
  @JsonKey(ignore: true)
  _$$_PositiveCopyWith<_$_Positive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NeutralCopyWith<$Res>
    implements $MultiTextFieldDialogEventCopyWith<$Res> {
  factory _$$_NeutralCopyWith(
          _$_Neutral value, $Res Function(_$_Neutral) then) =
      __$$_NeutralCopyWithImpl<$Res>;
  @override
  $Res call({List<MultiTextFieldDialogResult> results});
}

/// @nodoc
class __$$_NeutralCopyWithImpl<$Res>
    extends _$MultiTextFieldDialogEventCopyWithImpl<$Res>
    implements _$$_NeutralCopyWith<$Res> {
  __$$_NeutralCopyWithImpl(_$_Neutral _value, $Res Function(_$_Neutral) _then)
      : super(_value, (v) => _then(v as _$_Neutral));

  @override
  _$_Neutral get _value => super._value as _$_Neutral;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$_Neutral(
      results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MultiTextFieldDialogResult>,
    ));
  }
}

/// @nodoc

class _$_Neutral implements _Neutral {
  const _$_Neutral(final List<MultiTextFieldDialogResult> results)
      : _results = results;

  final List<MultiTextFieldDialogResult> _results;
  @override
  List<MultiTextFieldDialogResult> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MultiTextFieldDialogEvent.neutral(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Neutral &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      __$$_NeutralCopyWithImpl<_$_Neutral>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiTextFieldDialogResult> results)
        positive,
    required TResult Function(List<MultiTextFieldDialogResult> results) neutral,
    required TResult Function(List<MultiTextFieldDialogResult> results)
        negative,
  }) {
    return neutral(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
  }) {
    return neutral?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Positive value) positive,
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Negative value) negative,
  }) {
    return neutral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
  }) {
    return neutral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(this);
    }
    return orElse();
  }
}

abstract class _Neutral implements MultiTextFieldDialogEvent {
  const factory _Neutral(final List<MultiTextFieldDialogResult> results) =
      _$_Neutral;

  @override
  List<MultiTextFieldDialogResult> get results;
  @override
  @JsonKey(ignore: true)
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NegativeCopyWith<$Res>
    implements $MultiTextFieldDialogEventCopyWith<$Res> {
  factory _$$_NegativeCopyWith(
          _$_Negative value, $Res Function(_$_Negative) then) =
      __$$_NegativeCopyWithImpl<$Res>;
  @override
  $Res call({List<MultiTextFieldDialogResult> results});
}

/// @nodoc
class __$$_NegativeCopyWithImpl<$Res>
    extends _$MultiTextFieldDialogEventCopyWithImpl<$Res>
    implements _$$_NegativeCopyWith<$Res> {
  __$$_NegativeCopyWithImpl(
      _$_Negative _value, $Res Function(_$_Negative) _then)
      : super(_value, (v) => _then(v as _$_Negative));

  @override
  _$_Negative get _value => super._value as _$_Negative;

  @override
  $Res call({
    Object? results = freezed,
  }) {
    return _then(_$_Negative(
      results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MultiTextFieldDialogResult>,
    ));
  }
}

/// @nodoc

class _$_Negative implements _Negative {
  const _$_Negative(final List<MultiTextFieldDialogResult> results)
      : _results = results;

  final List<MultiTextFieldDialogResult> _results;
  @override
  List<MultiTextFieldDialogResult> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MultiTextFieldDialogEvent.negative(results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Negative &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_NegativeCopyWith<_$_Negative> get copyWith =>
      __$$_NegativeCopyWithImpl<_$_Negative>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<MultiTextFieldDialogResult> results)
        positive,
    required TResult Function(List<MultiTextFieldDialogResult> results) neutral,
    required TResult Function(List<MultiTextFieldDialogResult> results)
        negative,
  }) {
    return negative(results);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
  }) {
    return negative?.call(results);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<MultiTextFieldDialogResult> results)? positive,
    TResult Function(List<MultiTextFieldDialogResult> results)? neutral,
    TResult Function(List<MultiTextFieldDialogResult> results)? negative,
    required TResult orElse(),
  }) {
    if (negative != null) {
      return negative(results);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Positive value) positive,
    required TResult Function(_Neutral value) neutral,
    required TResult Function(_Negative value) negative,
  }) {
    return negative(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
  }) {
    return negative?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Neutral value)? neutral,
    TResult Function(_Negative value)? negative,
    required TResult orElse(),
  }) {
    if (negative != null) {
      return negative(this);
    }
    return orElse();
  }
}

abstract class _Negative implements MultiTextFieldDialogEvent {
  const factory _Negative(final List<MultiTextFieldDialogResult> results) =
      _$_Negative;

  @override
  List<MultiTextFieldDialogResult> get results;
  @override
  @JsonKey(ignore: true)
  _$$_NegativeCopyWith<_$_Negative> get copyWith =>
      throw _privateConstructorUsedError;
}
