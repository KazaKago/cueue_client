// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'text_field_dialog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextFieldDialogEvent {
  String get currentText => throw _privateConstructorUsedError;
  String? get originalText => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText)
        positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText)
        negative,
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
  $TextFieldDialogEventCopyWith<TextFieldDialogEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldDialogEventCopyWith<$Res> {
  factory $TextFieldDialogEventCopyWith(TextFieldDialogEvent value,
          $Res Function(TextFieldDialogEvent) then) =
      _$TextFieldDialogEventCopyWithImpl<$Res>;
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class _$TextFieldDialogEventCopyWithImpl<$Res>
    implements $TextFieldDialogEventCopyWith<$Res> {
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
abstract class _$$_PositiveCopyWith<$Res>
    implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$_PositiveCopyWith(
          _$_Positive value, $Res Function(_$_Positive) then) =
      __$$_PositiveCopyWithImpl<$Res>;
  @override
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$_PositiveCopyWithImpl<$Res>
    extends _$TextFieldDialogEventCopyWithImpl<$Res>
    implements _$$_PositiveCopyWith<$Res> {
  __$$_PositiveCopyWithImpl(
      _$_Positive _value, $Res Function(_$_Positive) _then)
      : super(_value, (v) => _then(v as _$_Positive));

  @override
  _$_Positive get _value => super._value as _$_Positive;

  @override
  $Res call({
    Object? currentText = freezed,
    Object? originalText = freezed,
  }) {
    return _then(_$_Positive(
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Positive &&
            const DeepCollectionEquality()
                .equals(other.currentText, currentText) &&
            const DeepCollectionEquality()
                .equals(other.originalText, originalText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentText),
      const DeepCollectionEquality().hash(originalText));

  @JsonKey(ignore: true)
  @override
  _$$_PositiveCopyWith<_$_Positive> get copyWith =>
      __$$_PositiveCopyWithImpl<_$_Positive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText)
        positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText)
        negative,
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
  const factory _Positive(final String currentText,
      {final String? originalText}) = _$_Positive;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$_PositiveCopyWith<_$_Positive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NeutralCopyWith<$Res>
    implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$_NeutralCopyWith(
          _$_Neutral value, $Res Function(_$_Neutral) then) =
      __$$_NeutralCopyWithImpl<$Res>;
  @override
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$_NeutralCopyWithImpl<$Res>
    extends _$TextFieldDialogEventCopyWithImpl<$Res>
    implements _$$_NeutralCopyWith<$Res> {
  __$$_NeutralCopyWithImpl(_$_Neutral _value, $Res Function(_$_Neutral) _then)
      : super(_value, (v) => _then(v as _$_Neutral));

  @override
  _$_Neutral get _value => super._value as _$_Neutral;

  @override
  $Res call({
    Object? currentText = freezed,
    Object? originalText = freezed,
  }) {
    return _then(_$_Neutral(
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Neutral &&
            const DeepCollectionEquality()
                .equals(other.currentText, currentText) &&
            const DeepCollectionEquality()
                .equals(other.originalText, originalText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentText),
      const DeepCollectionEquality().hash(originalText));

  @JsonKey(ignore: true)
  @override
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      __$$_NeutralCopyWithImpl<_$_Neutral>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText)
        positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText)
        negative,
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
  const factory _Neutral(final String currentText,
      {final String? originalText}) = _$_Neutral;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$_NeutralCopyWith<_$_Neutral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NegativeCopyWith<$Res>
    implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$_NegativeCopyWith(
          _$_Negative value, $Res Function(_$_Negative) then) =
      __$$_NegativeCopyWithImpl<$Res>;
  @override
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$_NegativeCopyWithImpl<$Res>
    extends _$TextFieldDialogEventCopyWithImpl<$Res>
    implements _$$_NegativeCopyWith<$Res> {
  __$$_NegativeCopyWithImpl(
      _$_Negative _value, $Res Function(_$_Negative) _then)
      : super(_value, (v) => _then(v as _$_Negative));

  @override
  _$_Negative get _value => super._value as _$_Negative;

  @override
  $Res call({
    Object? currentText = freezed,
    Object? originalText = freezed,
  }) {
    return _then(_$_Negative(
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Negative &&
            const DeepCollectionEquality()
                .equals(other.currentText, currentText) &&
            const DeepCollectionEquality()
                .equals(other.originalText, originalText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentText),
      const DeepCollectionEquality().hash(originalText));

  @JsonKey(ignore: true)
  @override
  _$$_NegativeCopyWith<_$_Negative> get copyWith =>
      __$$_NegativeCopyWithImpl<_$_Negative>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String currentText, String? originalText)
        positive,
    required TResult Function(String currentText, String? originalText) neutral,
    required TResult Function(String currentText, String? originalText)
        negative,
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
  const factory _Negative(final String currentText,
      {final String? originalText}) = _$_Negative;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$_NegativeCopyWith<_$_Negative> get copyWith =>
      throw _privateConstructorUsedError;
}
