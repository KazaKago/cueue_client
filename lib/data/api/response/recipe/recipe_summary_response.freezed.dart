// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeSummaryResponse _$RecipeSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _RecipeSummaryResponse.fromJson(json);
}

/// @nodoc
class _$RecipeSummaryResponseTearOff {
  const _$RecipeSummaryResponseTearOff();

  _RecipeSummaryResponse call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'title') required String title,
      @JsonKey(name: 'image') required ContentResponse? image,
      @JsonKey(name: 'last_cooking_at') required String? lastCookingAt}) {
    return _RecipeSummaryResponse(
      id: id,
      title: title,
      image: image,
      lastCookingAt: lastCookingAt,
    );
  }

  RecipeSummaryResponse fromJson(Map<String, Object?> json) {
    return RecipeSummaryResponse.fromJson(json);
  }
}

/// @nodoc
const $RecipeSummaryResponse = _$RecipeSummaryResponseTearOff();

/// @nodoc
mixin _$RecipeSummaryResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  String get title =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'image')
  ContentResponse? get image =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'last_cooking_at')
  String? get lastCookingAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeSummaryResponseCopyWith<RecipeSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSummaryResponseCopyWith<$Res> {
  factory $RecipeSummaryResponseCopyWith(RecipeSummaryResponse value,
          $Res Function(RecipeSummaryResponse) then) =
      _$RecipeSummaryResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') ContentResponse? image,
      @JsonKey(name: 'last_cooking_at') String? lastCookingAt});

  $ContentResponseCopyWith<$Res>? get image;
}

/// @nodoc
class _$RecipeSummaryResponseCopyWithImpl<$Res>
    implements $RecipeSummaryResponseCopyWith<$Res> {
  _$RecipeSummaryResponseCopyWithImpl(this._value, this._then);

  final RecipeSummaryResponse _value;
  // ignore: unused_field
  final $Res Function(RecipeSummaryResponse) _then;

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
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
      lastCookingAt: lastCookingAt == freezed
          ? _value.lastCookingAt
          : lastCookingAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ContentResponseCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ContentResponseCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$RecipeSummaryResponseCopyWith<$Res>
    implements $RecipeSummaryResponseCopyWith<$Res> {
  factory _$RecipeSummaryResponseCopyWith(_RecipeSummaryResponse value,
          $Res Function(_RecipeSummaryResponse) then) =
      __$RecipeSummaryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') ContentResponse? image,
      @JsonKey(name: 'last_cooking_at') String? lastCookingAt});

  @override
  $ContentResponseCopyWith<$Res>? get image;
}

/// @nodoc
class __$RecipeSummaryResponseCopyWithImpl<$Res>
    extends _$RecipeSummaryResponseCopyWithImpl<$Res>
    implements _$RecipeSummaryResponseCopyWith<$Res> {
  __$RecipeSummaryResponseCopyWithImpl(_RecipeSummaryResponse _value,
      $Res Function(_RecipeSummaryResponse) _then)
      : super(_value, (v) => _then(v as _RecipeSummaryResponse));

  @override
  _RecipeSummaryResponse get _value => super._value as _RecipeSummaryResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? lastCookingAt = freezed,
  }) {
    return _then(_RecipeSummaryResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
      lastCookingAt: lastCookingAt == freezed
          ? _value.lastCookingAt
          : lastCookingAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeSummaryResponse implements _RecipeSummaryResponse {
  const _$_RecipeSummaryResponse(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'last_cooking_at') required this.lastCookingAt});

  factory _$_RecipeSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeSummaryResponseFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  final int id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  final String title;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'image')
  final ContentResponse? image;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'last_cooking_at')
  final String? lastCookingAt;

  @override
  String toString() {
    return 'RecipeSummaryResponse(id: $id, title: $title, image: $image, lastCookingAt: $lastCookingAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeSummaryResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality()
                .equals(other.lastCookingAt, lastCookingAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(lastCookingAt));

  @JsonKey(ignore: true)
  @override
  _$RecipeSummaryResponseCopyWith<_RecipeSummaryResponse> get copyWith =>
      __$RecipeSummaryResponseCopyWithImpl<_RecipeSummaryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeSummaryResponseToJson(this);
  }
}

abstract class _RecipeSummaryResponse implements RecipeSummaryResponse {
  const factory _RecipeSummaryResponse(
          {@JsonKey(name: 'id') required int id,
          @JsonKey(name: 'title') required String title,
          @JsonKey(name: 'image') required ContentResponse? image,
          @JsonKey(name: 'last_cooking_at') required String? lastCookingAt}) =
      _$_RecipeSummaryResponse;

  factory _RecipeSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$_RecipeSummaryResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  String get title;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'image')
  ContentResponse? get image;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'last_cooking_at')
  String? get lastCookingAt;
  @override
  @JsonKey(ignore: true)
  _$RecipeSummaryResponseCopyWith<_RecipeSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
