// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  $TextFieldDialogEventCopyWith<TextFieldDialogEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextFieldDialogEventCopyWith<$Res> {
  factory $TextFieldDialogEventCopyWith(TextFieldDialogEvent value,
          $Res Function(TextFieldDialogEvent) then) =
      _$TextFieldDialogEventCopyWithImpl<$Res, TextFieldDialogEvent>;
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class _$TextFieldDialogEventCopyWithImpl<$Res,
        $Val extends TextFieldDialogEvent>
    implements $TextFieldDialogEventCopyWith<$Res> {
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
abstract class _$$PositiveImplCopyWith<$Res>
    implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$PositiveImplCopyWith(
          _$PositiveImpl value, $Res Function(_$PositiveImpl) then) =
      __$$PositiveImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$PositiveImplCopyWithImpl<$Res>
    extends _$TextFieldDialogEventCopyWithImpl<$Res, _$PositiveImpl>
    implements _$$PositiveImplCopyWith<$Res> {
  __$$PositiveImplCopyWithImpl(
      _$PositiveImpl _value, $Res Function(_$PositiveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentText = null,
    Object? originalText = freezed,
  }) {
    return _then(_$PositiveImpl(
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

class _$PositiveImpl implements _Positive {
  const _$PositiveImpl(this.currentText, {this.originalText});

  @override
  final String currentText;
  @override
  final String? originalText;

  @override
  String toString() {
    return 'TextFieldDialogEvent.positive(currentText: $currentText, originalText: $originalText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositiveImpl &&
            (identical(other.currentText, currentText) ||
                other.currentText == currentText) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentText, originalText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PositiveImplCopyWith<_$PositiveImpl> get copyWith =>
      __$$PositiveImplCopyWithImpl<_$PositiveImpl>(this, _$identity);

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
  const factory _Positive(final String currentText,
      {final String? originalText}) = _$PositiveImpl;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$PositiveImplCopyWith<_$PositiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NeutralImplCopyWith<$Res>
    implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$NeutralImplCopyWith(
          _$NeutralImpl value, $Res Function(_$NeutralImpl) then) =
      __$$NeutralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$NeutralImplCopyWithImpl<$Res>
    extends _$TextFieldDialogEventCopyWithImpl<$Res, _$NeutralImpl>
    implements _$$NeutralImplCopyWith<$Res> {
  __$$NeutralImplCopyWithImpl(
      _$NeutralImpl _value, $Res Function(_$NeutralImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentText = null,
    Object? originalText = freezed,
  }) {
    return _then(_$NeutralImpl(
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

class _$NeutralImpl implements _Neutral {
  const _$NeutralImpl(this.currentText, {this.originalText});

  @override
  final String currentText;
  @override
  final String? originalText;

  @override
  String toString() {
    return 'TextFieldDialogEvent.neutral(currentText: $currentText, originalText: $originalText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NeutralImpl &&
            (identical(other.currentText, currentText) ||
                other.currentText == currentText) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentText, originalText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NeutralImplCopyWith<_$NeutralImpl> get copyWith =>
      __$$NeutralImplCopyWithImpl<_$NeutralImpl>(this, _$identity);

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
  const factory _Neutral(final String currentText,
      {final String? originalText}) = _$NeutralImpl;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$NeutralImplCopyWith<_$NeutralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NegativeImplCopyWith<$Res>
    implements $TextFieldDialogEventCopyWith<$Res> {
  factory _$$NegativeImplCopyWith(
          _$NegativeImpl value, $Res Function(_$NegativeImpl) then) =
      __$$NegativeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String currentText, String? originalText});
}

/// @nodoc
class __$$NegativeImplCopyWithImpl<$Res>
    extends _$TextFieldDialogEventCopyWithImpl<$Res, _$NegativeImpl>
    implements _$$NegativeImplCopyWith<$Res> {
  __$$NegativeImplCopyWithImpl(
      _$NegativeImpl _value, $Res Function(_$NegativeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentText = null,
    Object? originalText = freezed,
  }) {
    return _then(_$NegativeImpl(
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

class _$NegativeImpl implements _Negative {
  const _$NegativeImpl(this.currentText, {this.originalText});

  @override
  final String currentText;
  @override
  final String? originalText;

  @override
  String toString() {
    return 'TextFieldDialogEvent.negative(currentText: $currentText, originalText: $originalText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegativeImpl &&
            (identical(other.currentText, currentText) ||
                other.currentText == currentText) &&
            (identical(other.originalText, originalText) ||
                other.originalText == originalText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentText, originalText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NegativeImplCopyWith<_$NegativeImpl> get copyWith =>
      __$$NegativeImplCopyWithImpl<_$NegativeImpl>(this, _$identity);

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
  const factory _Negative(final String currentText,
      {final String? originalText}) = _$NegativeImpl;

  @override
  String get currentText;
  @override
  String? get originalText;
  @override
  @JsonKey(ignore: true)
  _$$NegativeImplCopyWith<_$NegativeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
