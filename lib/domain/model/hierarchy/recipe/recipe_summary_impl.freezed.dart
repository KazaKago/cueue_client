// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_summary_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecipeSummaryImplTearOff {
  const _$RecipeSummaryImplTearOff();

  _RecipeSummaryImpl call(
      {required RecipeId id,
      required String title,
      required Content? image,
      required DateTime? lastCookingAt}) {
    return _RecipeSummaryImpl(
      id: id,
      title: title,
      image: image,
      lastCookingAt: lastCookingAt,
    );
  }
}

/// @nodoc
const $RecipeSummaryImpl = _$RecipeSummaryImplTearOff();

/// @nodoc
mixin _$RecipeSummaryImpl {
  RecipeId get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  Content? get image => throw _privateConstructorUsedError;
  DateTime? get lastCookingAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeSummaryImplCopyWith<RecipeSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSummaryImplCopyWith<$Res> {
  factory $RecipeSummaryImplCopyWith(
          RecipeSummaryImpl value, $Res Function(RecipeSummaryImpl) then) =
      _$RecipeSummaryImplCopyWithImpl<$Res>;
  $Res call(
      {RecipeId id, String title, Content? image, DateTime? lastCookingAt});

  $RecipeIdCopyWith<$Res> get id;
  $ContentCopyWith<$Res>? get image;
}

/// @nodoc
class _$RecipeSummaryImplCopyWithImpl<$Res>
    implements $RecipeSummaryImplCopyWith<$Res> {
  _$RecipeSummaryImplCopyWithImpl(this._value, this._then);

  final RecipeSummaryImpl _value;
  // ignore: unused_field
  final $Res Function(RecipeSummaryImpl) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? lastCookingAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as RecipeId,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Content?,
      lastCookingAt: lastCookingAt == freezed
          ? _value.lastCookingAt
          : lastCookingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  $RecipeIdCopyWith<$Res> get id {
    return $RecipeIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $ContentCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$RecipeSummaryImplCopyWith<$Res>
    implements $RecipeSummaryImplCopyWith<$Res> {
  factory _$RecipeSummaryImplCopyWith(
          _RecipeSummaryImpl value, $Res Function(_RecipeSummaryImpl) then) =
      __$RecipeSummaryImplCopyWithImpl<$Res>;
  @override
  $Res call(
      {RecipeId id, String title, Content? image, DateTime? lastCookingAt});

  @override
  $RecipeIdCopyWith<$Res> get id;
  @override
  $ContentCopyWith<$Res>? get image;
}

/// @nodoc
class __$RecipeSummaryImplCopyWithImpl<$Res>
    extends _$RecipeSummaryImplCopyWithImpl<$Res>
    implements _$RecipeSummaryImplCopyWith<$Res> {
  __$RecipeSummaryImplCopyWithImpl(
      _RecipeSummaryImpl _value, $Res Function(_RecipeSummaryImpl) _then)
      : super(_value, (v) => _then(v as _RecipeSummaryImpl));

  @override
  _RecipeSummaryImpl get _value => super._value as _RecipeSummaryImpl;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? lastCookingAt = freezed,
  }) {
    return _then(_RecipeSummaryImpl(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as RecipeId,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Content?,
      lastCookingAt: lastCookingAt == freezed
          ? _value.lastCookingAt
          : lastCookingAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_RecipeSummaryImpl implements _RecipeSummaryImpl {
  const _$_RecipeSummaryImpl(
      {required this.id,
      required this.title,
      required this.image,
      required this.lastCookingAt});

  @override
  final RecipeId id;
  @override
  final String title;
  @override
  final Content? image;
  @override
  final DateTime? lastCookingAt;

  @override
  String toString() {
    return 'RecipeSummaryImpl(id: $id, title: $title, image: $image, lastCookingAt: $lastCookingAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeSummaryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lastCookingAt, lastCookingAt) ||
                other.lastCookingAt == lastCookingAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, image, lastCookingAt);

  @JsonKey(ignore: true)
  @override
  _$RecipeSummaryImplCopyWith<_RecipeSummaryImpl> get copyWith =>
      __$RecipeSummaryImplCopyWithImpl<_RecipeSummaryImpl>(this, _$identity);
}

abstract class _RecipeSummaryImpl implements RecipeSummaryImpl {
  const factory _RecipeSummaryImpl(
      {required RecipeId id,
      required String title,
      required Content? image,
      required DateTime? lastCookingAt}) = _$_RecipeSummaryImpl;

  @override
  RecipeId get id;
  @override
  String get title;
  @override
  Content? get image;
  @override
  DateTime? get lastCookingAt;
  @override
  @JsonKey(ignore: true)
  _$RecipeSummaryImplCopyWith<_RecipeSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
