// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'text_field_dialog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TextFieldDialogEventTearOff {
  const _$TextFieldDialogEventTearOff();

  _Positive positive(String currentText, {String? originalText}) {
    return _Positive(
      currentText,
      originalText: originalText,
    );
  }

  _Neutral neutral(String currentText, {String? originalText}) {
    return _Neutral(
      currentText,
      originalText: originalText,
    );
  }

  _Negative negative(String currentText, {String? originalText}) {
    return _Negative(
      currentText,
      originalText: originalText,
    );
  }
}

/// @nodoc
const $TextFieldDialogEvent = _$TextFieldDialogEventTearOff();

/// @nodoc
mixin _$TextFieldDialogEvent {
  String get currentText => throw _privateConstructorUsedError;
  String? get originalText => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText) positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText) negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
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
  $TextFieldDialogEventCopyWith<TextFieldDialogEvent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldDialogEventCopyWith<$Res> {
  factory $TextFieldDialogEventCopyWith(TextFieldDialogEvent value, $Res Function(TextFieldDialogEvent) then) = _$TextFieldDialogEventCopyWithImpl<$Res>;
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class _$TextFieldDialogEventCopyWithImpl<$Res> implements $TextFieldDialogEventCopyWith<$Res> {
  _$TextFieldDialogEventCopyWithImpl(this._value, this._then);

  final TextFieldDialogEvent _value;
  // ignore: unused_field
  final $Res Function(TextFieldDialogEvent) _then;

  @override
  $Res call({
    Object? currentText = freezed,
    Object? originalText = freezed,
  }) {
    return _then(_value.copyWith(
      currentText: currentText == freezed
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: originalText == freezed
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PositiveCopyWith<$Res> implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$PositiveCopyWith(_Positive value, $Res Function(_Positive) then) = __$PositiveCopyWithImpl<$Res>;
  @override
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$PositiveCopyWithImpl<$Res> extends _$TextFieldDialogEventCopyWithImpl<$Res> implements _$PositiveCopyWith<$Res> {
  __$PositiveCopyWithImpl(_Positive _value, $Res Function(_Positive) _then) : super(_value, (v) => _then(v as _Positive));

  @override
  _Positive get _value => super._value as _Positive;

  @override
  $Res call({
    Object? currentText = freezed,
    Object? originalText = freezed,
  }) {
    return _then(_Positive(
      currentText == freezed
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: originalText == freezed
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Positive implements _Positive {
  const _$_Positive(this.currentText, {this.originalText});

  @override
  final String currentText;
  @override
  final String? originalText;

  @override
  String toString() {
    return 'TextFieldDialogEvent.positive(currentText: $currentText, originalText: $originalText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Positive && const DeepCollectionEquality().equals(other.currentText, currentText) && const DeepCollectionEquality().equals(other.originalText, originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(currentText), const DeepCollectionEquality().hash(originalText));

  @JsonKey(ignore: true)
  @override
  _$PositiveCopyWith<_Positive> get copyWith => __$PositiveCopyWithImpl<_Positive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText) positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText) negative,
  }) {
    return positive(currentText, originalText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
  }) {
    return positive?.call(currentText, originalText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
    required TResult orElse(),
  }) {
    if (positive != null) {
      return positive(currentText, originalText);
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

abstract class _Positive implements TextFieldDialogEvent {
  const factory _Positive(String currentText, {String? originalText}) = _$_Positive;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$PositiveCopyWith<_Positive> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NeutralCopyWith<$Res> implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$NeutralCopyWith(_Neutral value, $Res Function(_Neutral) then) = __$NeutralCopyWithImpl<$Res>;
  @override
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$NeutralCopyWithImpl<$Res> extends _$TextFieldDialogEventCopyWithImpl<$Res> implements _$NeutralCopyWith<$Res> {
  __$NeutralCopyWithImpl(_Neutral _value, $Res Function(_Neutral) _then) : super(_value, (v) => _then(v as _Neutral));

  @override
  _Neutral get _value => super._value as _Neutral;

  @override
  $Res call({
    Object? currentText = freezed,
    Object? originalText = freezed,
  }) {
    return _then(_Neutral(
      currentText == freezed
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: originalText == freezed
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Neutral implements _Neutral {
  const _$_Neutral(this.currentText, {this.originalText});

  @override
  final String currentText;
  @override
  final String? originalText;

  @override
  String toString() {
    return 'TextFieldDialogEvent.neutral(currentText: $currentText, originalText: $originalText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Neutral && const DeepCollectionEquality().equals(other.currentText, currentText) && const DeepCollectionEquality().equals(other.originalText, originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(currentText), const DeepCollectionEquality().hash(originalText));

  @JsonKey(ignore: true)
  @override
  _$NeutralCopyWith<_Neutral> get copyWith => __$NeutralCopyWithImpl<_Neutral>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText) positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText) negative,
  }) {
    return neutral(currentText, originalText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
  }) {
    return neutral?.call(currentText, originalText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
    required TResult orElse(),
  }) {
    if (neutral != null) {
      return neutral(currentText, originalText);
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

abstract class _Neutral implements TextFieldDialogEvent {
  const factory _Neutral(String currentText, {String? originalText}) = _$_Neutral;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$NeutralCopyWith<_Neutral> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NegativeCopyWith<$Res> implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$NegativeCopyWith(_Negative value, $Res Function(_Negative) then) = __$NegativeCopyWithImpl<$Res>;
  @override
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$NegativeCopyWithImpl<$Res> extends _$TextFieldDialogEventCopyWithImpl<$Res> implements _$NegativeCopyWith<$Res> {
  __$NegativeCopyWithImpl(_Negative _value, $Res Function(_Negative) _then) : super(_value, (v) => _then(v as _Negative));

  @override
  _Negative get _value => super._value as _Negative;

  @override
  $Res call({
    Object? currentText = freezed,
    Object? originalText = freezed,
  }) {
    return _then(_Negative(
      currentText == freezed
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: originalText == freezed
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Negative implements _Negative {
  const _$_Negative(this.currentText, {this.originalText});

  @override
  final String currentText;
  @override
  final String? originalText;

  @override
  String toString() {
    return 'TextFieldDialogEvent.negative(currentText: $currentText, originalText: $originalText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Negative && const DeepCollectionEquality().equals(other.currentText, currentText) && const DeepCollectionEquality().equals(other.originalText, originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(currentText), const DeepCollectionEquality().hash(originalText));

  @JsonKey(ignore: true)
  @override
  _$NegativeCopyWith<_Negative> get copyWith => __$NegativeCopyWithImpl<_Negative>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText) positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText) negative,
  }) {
    return negative(currentText, originalText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
  }) {
    return negative?.call(currentText, originalText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String currentText, String? originalText)? positive,
    TResult Function(String currentText, String? originalText)? neutral,
    TResult Function(String currentText, String? originalText)? negative,
    required TResult orElse(),
  }) {
    if (negative != null) {
      return negative(currentText, originalText);
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

abstract class _Negative implements TextFieldDialogEvent {
  const factory _Negative(String currentText, {String? originalText}) = _$_Negative;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$NegativeCopyWith<_Negative> get copyWith => throw _privateConstructorUsedError;
}
