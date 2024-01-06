// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeResponse _$RecipeResponseFromJson(Map<String, dynamic> json) {
  return _RecipeResponse.fromJson(json);
}

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
      _$RecipeResponseCopyWithImpl<$Res, RecipeResponse>;
  @useResult
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
class _$RecipeResponseCopyWithImpl<$Res, $Val extends RecipeResponse>
    implements $RecipeResponseCopyWith<$Res> {
  _$RecipeResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? url = freezed,
    Object? images = null,
    Object? tags = null,
    Object? cookingHistories = null,
    Object? cookingCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ContentResponse>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>,
      cookingHistories: null == cookingHistories
          ? _value.cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cookingCount: null == cookingCount
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeResponseImplCopyWith<$Res>
    implements $RecipeResponseCopyWith<$Res> {
  factory _$$RecipeResponseImplCopyWith(_$RecipeResponseImpl value,
          $Res Function(_$RecipeResponseImpl) then) =
      __$$RecipeResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$RecipeResponseImplCopyWithImpl<$Res>
    extends _$RecipeResponseCopyWithImpl<$Res, _$RecipeResponseImpl>
    implements _$$RecipeResponseImplCopyWith<$Res> {
  __$$RecipeResponseImplCopyWithImpl(
      _$RecipeResponseImpl _value, $Res Function(_$RecipeResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? url = freezed,
    Object? images = null,
    Object? tags = null,
    Object? cookingHistories = null,
    Object? cookingCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RecipeResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<ContentResponse>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>,
      cookingHistories: null == cookingHistories
          ? _value._cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cookingCount: null == cookingCount
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeResponseImpl implements _RecipeResponse {
  const _$RecipeResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'images') required final List<ContentResponse> images,
      @JsonKey(name: 'tags') required final List<TagResponse> tags,
      @JsonKey(name: 'cooking_histories')
      required final List<String> cookingHistories,
      @JsonKey(name: 'cooking_count') required this.cookingCount,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _images = images,
        _tags = tags,
        _cookingHistories = cookingHistories;

  factory _$RecipeResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeResponseImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'id')
  final int id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'title')
  final String title;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'description')
  final String description;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'url')
  final String? url;
// ignore: invalid_annotation_target
  final List<ContentResponse> _images;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'images')
  List<ContentResponse> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

// ignore: invalid_annotation_target
  final List<TagResponse> _tags;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'tags')
  List<TagResponse> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// ignore: invalid_annotation_target
  final List<String> _cookingHistories;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'cooking_histories')
  List<String> get cookingHistories {
    if (_cookingHistories is EqualUnmodifiableListView)
      return _cookingHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cookingHistories);
  }

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'cooking_count')
  final int cookingCount;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'RecipeResponse(id: $id, title: $title, description: $description, url: $url, images: $images, tags: $tags, cookingHistories: $cookingHistories, cookingCount: $cookingCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._cookingHistories, _cookingHistories) &&
            (identical(other.cookingCount, cookingCount) ||
                other.cookingCount == cookingCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      url,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_cookingHistories),
      cookingCount,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeResponseImplCopyWith<_$RecipeResponseImpl> get copyWith =>
      __$$RecipeResponseImplCopyWithImpl<_$RecipeResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeResponseImplToJson(
      this,
    );
  }
}

abstract class _RecipeResponse implements RecipeResponse {
  const factory _RecipeResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'description') required final String description,
          @JsonKey(name: 'url') required final String? url,
          @JsonKey(name: 'images') required final List<ContentResponse> images,
          @JsonKey(name: 'tags') required final List<TagResponse> tags,
          @JsonKey(name: 'cooking_histories')
          required final List<String> cookingHistories,
          @JsonKey(name: 'cooking_count') required final int cookingCount,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$RecipeResponseImpl;

  factory _RecipeResponse.fromJson(Map<String, dynamic> json) =
      _$RecipeResponseImpl.fromJson;

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
  _$$RecipeResponseImplCopyWith<_$RecipeResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
