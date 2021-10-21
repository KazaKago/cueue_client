// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeResponse _$RecipeResponseFromJson(Map<String, dynamic> json) {
  return _RecipeResponse.fromJson(json);
}

/// @nodoc
class _$RecipeResponseTearOff {
  const _$RecipeResponseTearOff();

  _RecipeResponse call(
      {@JsonKey(name: 'id')
          required int id,
      @JsonKey(name: 'title')
          required String title,
      @JsonKey(name: 'description')
          required String description,
      @JsonKey(name: 'url')
          required String? url,
      @JsonKey(name: 'images')
          required List<ContentResponse> images,
      @JsonKey(name: 'tags')
          required List<TagResponse> tags,
      @JsonKey(name: 'cooking_histories')
          required List<String> cookingHistories,
      @JsonKey(name: 'cooking_count')
          required int cookingCount,
      @JsonKey(name: 'created_at')
          required String createdAt,
      @JsonKey(name: 'updated_at')
          required String updatedAt}) {
    return _RecipeResponse(
      id: id,
      title: title,
      description: description,
      url: url,
      images: images,
      tags: tags,
      cookingHistories: cookingHistories,
      cookingCount: cookingCount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  RecipeResponse fromJson(Map<String, Object?> json) {
    return RecipeResponse.fromJson(json);
  }
}

/// @nodoc
const $RecipeResponse = _$RecipeResponseTearOff();

/// @nodoc
mixin _$RecipeResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  String get title =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'description')
  String get description =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'url')
  String? get url =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'images')
  List<ContentResponse> get images =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'tags')
  List<TagResponse> get tags =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_histories')
  List<String> get cookingHistories =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_count')
  int get cookingCount =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  String get createdAt =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeResponseCopyWith<RecipeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeResponseCopyWith<$Res> {
  factory $RecipeResponseCopyWith(
          RecipeResponse value, $Res Function(RecipeResponse) then) =
      _$RecipeResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'images') List<ContentResponse> images,
      @JsonKey(name: 'tags') List<TagResponse> tags,
      @JsonKey(name: 'cooking_histories') List<String> cookingHistories,
      @JsonKey(name: 'cooking_count') int cookingCount,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$RecipeResponseCopyWithImpl<$Res>
    implements $RecipeResponseCopyWith<$Res> {
  _$RecipeResponseCopyWithImpl(this._value, this._then);

  final RecipeResponse _value;
  // ignore: unused_field
  final $Res Function(RecipeResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? images = freezed,
    Object? tags = freezed,
    Object? cookingHistories = freezed,
    Object? cookingCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ContentResponse>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>,
      cookingHistories: cookingHistories == freezed
          ? _value.cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cookingCount: cookingCount == freezed
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RecipeResponseCopyWith<$Res>
    implements $RecipeResponseCopyWith<$Res> {
  factory _$RecipeResponseCopyWith(
          _RecipeResponse value, $Res Function(_RecipeResponse) then) =
      __$RecipeResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'images') List<ContentResponse> images,
      @JsonKey(name: 'tags') List<TagResponse> tags,
      @JsonKey(name: 'cooking_histories') List<String> cookingHistories,
      @JsonKey(name: 'cooking_count') int cookingCount,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$RecipeResponseCopyWithImpl<$Res>
    extends _$RecipeResponseCopyWithImpl<$Res>
    implements _$RecipeResponseCopyWith<$Res> {
  __$RecipeResponseCopyWithImpl(
      _RecipeResponse _value, $Res Function(_RecipeResponse) _then)
      : super(_value, (v) => _then(v as _RecipeResponse));

  @override
  _RecipeResponse get _value => super._value as _RecipeResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? images = freezed,
    Object? tags = freezed,
    Object? cookingHistories = freezed,
    Object? cookingCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_RecipeResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ContentResponse>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>,
      cookingHistories: cookingHistories == freezed
          ? _value.cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cookingCount: cookingCount == freezed
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeResponse implements _RecipeResponse {
  const _$_RecipeResponse(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'images') required this.images,
      @JsonKey(name: 'tags') required this.tags,
      @JsonKey(name: 'cooking_histories') required this.cookingHistories,
      @JsonKey(name: 'cooking_count') required this.cookingCount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$_RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeResponseFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  final int id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  final String title;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'description')
  final String description;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'url')
  final String? url;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'images')
  final List<ContentResponse> images;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tags')
  final List<TagResponse> tags;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_histories')
  final List<String> cookingHistories;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_count')
  final int cookingCount;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'RecipeResponse(id: $id, title: $title, description: $description, url: $url, images: $images, tags: $tags, cookingHistories: $cookingHistories, cookingCount: $cookingCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.cookingHistories, cookingHistories) &&
            (identical(other.cookingCount, cookingCount) ||
                other.cookingCount == cookingCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      url,
      const DeepCollectionEquality().hash(images),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(cookingHistories),
      cookingCount,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  _$RecipeResponseCopyWith<_RecipeResponse> get copyWith =>
      __$RecipeResponseCopyWithImpl<_RecipeResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeResponseToJson(this);
  }
}

abstract class _RecipeResponse implements RecipeResponse {
  const factory _RecipeResponse(
      {@JsonKey(name: 'id')
          required int id,
      @JsonKey(name: 'title')
          required String title,
      @JsonKey(name: 'description')
          required String description,
      @JsonKey(name: 'url')
          required String? url,
      @JsonKey(name: 'images')
          required List<ContentResponse> images,
      @JsonKey(name: 'tags')
          required List<TagResponse> tags,
      @JsonKey(name: 'cooking_histories')
          required List<String> cookingHistories,
      @JsonKey(name: 'cooking_count')
          required int cookingCount,
      @JsonKey(name: 'created_at')
          required String createdAt,
      @JsonKey(name: 'updated_at')
          required String updatedAt}) = _$_RecipeResponse;

  factory _RecipeResponse.fromJson(Map<String, dynamic> json) =
      _$_RecipeResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  String get title;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'description')
  String get description;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'url')
  String? get url;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'images')
  List<ContentResponse> get images;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tags')
  List<TagResponse> get tags;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_histories')
  List<String> get cookingHistories;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_count')
  int get cookingCount;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$RecipeResponseCopyWith<_RecipeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
