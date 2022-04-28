// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      {@JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'title')
          required this.title,
      @JsonKey(name: 'description')
          required this.description,
      @JsonKey(name: 'url')
          required this.url,
      @JsonKey(name: 'images')
          required final List<ContentResponse> images,
      @JsonKey(name: 'tags')
          required final List<TagResponse> tags,
      @JsonKey(name: 'cooking_histories')
          required final List<String> cookingHistories,
      @JsonKey(name: 'cooking_count')
          required this.cookingCount,
      @JsonKey(name: 'created_at')
          required this.createdAt,
      @JsonKey(name: 'updated_at')
          required this.updatedAt})
      : _images = images,
        _tags = tags,
        _cookingHistories = cookingHistories;

  factory _$_RecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeResponseFromJson(json);

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
  @JsonKey(name: 'images')
  final List<ContentResponse> _images;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'images')
  List<ContentResponse> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

// ignore: invalid_annotation_target
  @JsonKey(name: 'tags')
  final List<TagResponse> _tags;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'tags')
  List<TagResponse> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

// ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_histories')
  final List<String> _cookingHistories;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'cooking_histories')
  List<String> get cookingHistories {
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecipeResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.cookingHistories, cookingHistories) &&
            const DeepCollectionEquality()
                .equals(other.cookingCount, cookingCount) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(images),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(cookingHistories),
      const DeepCollectionEquality().hash(cookingCount),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt));

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
          required final int id,
      @JsonKey(name: 'title')
          required final String title,
      @JsonKey(name: 'description')
          required final String description,
      @JsonKey(name: 'url')
          required final String? url,
      @JsonKey(name: 'images')
          required final List<ContentResponse> images,
      @JsonKey(name: 'tags')
          required final List<TagResponse> tags,
      @JsonKey(name: 'cooking_histories')
          required final List<String> cookingHistories,
      @JsonKey(name: 'cooking_count')
          required final int cookingCount,
      @JsonKey(name: 'created_at')
          required final String createdAt,
      @JsonKey(name: 'updated_at')
          required final String updatedAt}) = _$_RecipeResponse;

  factory _RecipeResponse.fromJson(Map<String, dynamic> json) =
      _$_RecipeResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'images')
  List<ContentResponse> get images => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tags')
  List<TagResponse> get tags => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_histories')
  List<String> get cookingHistories => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'cooking_count')
  int get cookingCount => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecipeResponseCopyWith<_RecipeResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
