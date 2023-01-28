// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'text_field_dialog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    TResult? Function(String currentText, String? originalText)? positive,
    TResult? Function(String currentText, String? originalText)? neutral,
    TResult? Function(String currentText, String? originalText)? negative,
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
    TResult? Function(_Positive value)? positive,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Negative value)? negative,
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
  factory $TextFieldDialogEventCopyWith(TextFieldDialogEvent value, $Res Function(TextFieldDialogEvent) then) = _$TextFieldDialogEventCopyWithImpl<$Res, TextFieldDialogEvent>;
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class _$TextFieldDialogEventCopyWithImpl<$Res, $Val extends TextFieldDialogEvent> implements $TextFieldDialogEventCopyWith<$Res> {
  _$TextFieldDialogEventCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentText = null,
    Object? originalText = freezed,
  }) {
    return _then(_value.copyWith(
      currentText: null == currentText
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: freezed == originalText
          ? _value.originalText
          : originalText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PositiveCopyWith<$Res> implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$_PositiveCopyWith(_$_Positive value, $Res Function(_$_Positive) then) = __$$_PositiveCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$_PositiveCopyWithImpl<$Res> extends _$TextFieldDialogEventCopyWithImpl<$Res, _$_Positive> implements _$$_PositiveCopyWith<$Res> {
  __$$_PositiveCopyWithImpl(_$_Positive _value, $Res Function(_$_Positive) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentText = null,
    Object? originalText = freezed,
  }) {
    return _then(_$_Positive(
      null == currentText
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: freezed == originalText
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
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Positive && (identical(other.currentText, currentText) || other.currentText == currentText) && (identical(other.originalText, originalText) || other.originalText == originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentText, originalText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PositiveCopyWith<_$_Positive> get copyWith => __$$_PositiveCopyWithImpl<_$_Positive>(this, _$identity);

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
    TResult? Function(String currentText, String? originalText)? positive,
    TResult? Function(String currentText, String? originalText)? neutral,
    TResult? Function(String currentText, String? originalText)? negative,
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
    TResult? Function(_Positive value)? positive,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Negative value)? negative,
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
  const factory _Positive(final String currentText, {final String? originalText}) = _$_Positive;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$_PositiveCopyWith<_$_Positive> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NeutralCopyWith<$Res> implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$_NeutralCopyWith(_$_Neutral value, $Res Function(_$_Neutral) then) = __$$_NeutralCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$_NeutralCopyWithImpl<$Res> extends _$TextFieldDialogEventCopyWithImpl<$Res, _$_Neutral> implements _$$_NeutralCopyWith<$Res> {
  __$$_NeutralCopyWithImpl(_$_Neutral _value, $Res Function(_$_Neutral) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentText = null,
    Object? originalText = freezed,
  }) {
    return _then(_$_Neutral(
      null == currentText
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: freezed == originalText
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
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Neutral && (identical(other.currentText, currentText) || other.currentText == currentText) && (identical(other.originalText, originalText) || other.originalText == originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentText, originalText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NeutralCopyWith<_$_Neutral> get copyWith => __$$_NeutralCopyWithImpl<_$_Neutral>(this, _$identity);

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
    TResult? Function(String currentText, String? originalText)? positive,
    TResult? Function(String currentText, String? originalText)? neutral,
    TResult? Function(String currentText, String? originalText)? negative,
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
    TResult? Function(_Positive value)? positive,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Negative value)? negative,
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
  const factory _Neutral(final String currentText, {final String? originalText}) = _$_Neutral;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$_NeutralCopyWith<_$_Neutral> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NegativeCopyWith<$Res> implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$_NegativeCopyWith(_$_Negative value, $Res Function(_$_Negative) then) = __$$_NegativeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$_NegativeCopyWithImpl<$Res> extends _$TextFieldDialogEventCopyWithImpl<$Res, _$_Negative> implements _$$_NegativeCopyWith<$Res> {
  __$$_NegativeCopyWithImpl(_$_Negative _value, $Res Function(_$_Negative) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentText = null,
    Object? originalText = freezed,
  }) {
    return _then(_$_Negative(
      null == currentText
          ? _value.currentText
          : currentText // ignore: cast_nullable_to_non_nullable
              as String,
      originalText: freezed == originalText
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
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Negative && (identical(other.currentText, currentText) || other.currentText == currentText) && (identical(other.originalText, originalText) || other.originalText == originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentText, originalText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NegativeCopyWith<_$_Negative> get copyWith => __$$_NegativeCopyWithImpl<_$_Negative>(this, _$identity);

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
    TResult? Function(String currentText, String? originalText)? positive,
    TResult? Function(String currentText, String? originalText)? neutral,
    TResult? Function(String currentText, String? originalText)? negative,
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
    TResult? Function(_Positive value)? positive,
    TResult? Function(_Neutral value)? neutral,
    TResult? Function(_Negative value)? negative,
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
  const factory _Negative(final String currentText, {final String? originalText}) = _$_Negative;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$_NegativeCopyWith<_$_Negative> get copyWith => throw _privateConstructorUsedError;
}
