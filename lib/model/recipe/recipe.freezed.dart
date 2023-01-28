// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Recipe {
  RecipeId get id => throw _privateConstructorUsedError;

  String get title => throw _privateConstructorUsedError;

  String get description => throw _privateConstructorUsedError;

  Uri? get url => throw _privateConstructorUsedError;

  List<Content> get images => throw _privateConstructorUsedError;

  List<Tag> get tags => throw _privateConstructorUsedError;

  List<DateTime> get cookingHistories => throw _privateConstructorUsedError;

  int get cookingCount => throw _privateConstructorUsedError;

  DateTime get createdAt => throw _privateConstructorUsedError;

  DateTime get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) = _$RecipeCopyWithImpl<$Res, Recipe>;

  @useResult
  $Res call({RecipeId id, String title, String description, Uri? url, List<Content> images, List<Tag> tags, List<DateTime> cookingHistories, int cookingCount, DateTime createdAt, DateTime updatedAt});

  $RecipeIdCopyWith<$Res> get id;
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

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
              as RecipeId,
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
              as Uri?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      cookingHistories: null == cookingHistories
          ? _value.cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      cookingCount: null == cookingCount
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeIdCopyWith<$Res> get id {
    return $RecipeIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) = __$$_RecipeCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({RecipeId id, String title, String description, Uri? url, List<Content> images, List<Tag> tags, List<DateTime> cookingHistories, int cookingCount, DateTime createdAt, DateTime updatedAt});

  @override
  $RecipeIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res> extends _$RecipeCopyWithImpl<$Res, _$_Recipe> implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then) : super(_value, _then);

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
    return _then(_$_Recipe(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as RecipeId,
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
              as Uri?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      cookingHistories: null == cookingHistories
          ? _value._cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      cookingCount: null == cookingCount
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Recipe extends _Recipe {
  const _$_Recipe({required this.id, required this.title, required this.description, required this.url, required final List<Content> images, required final List<Tag> tags, required final List<DateTime> cookingHistories, required this.cookingCount, required this.createdAt, required this.updatedAt})
      : _images = images,
        _tags = tags,
        _cookingHistories = cookingHistories,
        super._();

  @override
  final RecipeId id;
  @override
  final String title;
  @override
  final String description;
  @override
  final Uri? url;
  final List<Content> _images;

  @override
  List<Content> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Tag> _tags;

  @override
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<DateTime> _cookingHistories;

  @override
  List<DateTime> get cookingHistories {
    if (_cookingHistories is EqualUnmodifiableListView) return _cookingHistories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cookingHistories);
  }

  @override
  final int cookingCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Recipe(id: $id, title: $title, description: $description, url: $url, images: $images, tags: $tags, cookingHistories: $cookingHistories, cookingCount: $cookingCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Recipe && (identical(other.id, id) || other.id == id) && (identical(other.title, title) || other.title == title) && (identical(other.description, description) || other.description == description) && (identical(other.url, url) || other.url == url) && const DeepCollectionEquality().equals(other._images, _images) && const DeepCollectionEquality().equals(other._tags, _tags) && const DeepCollectionEquality().equals(other._cookingHistories, _cookingHistories) && (identical(other.cookingCount, cookingCount) || other.cookingCount == cookingCount) && (identical(other.createdAt, createdAt) || other.createdAt == createdAt) && (identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, url, const DeepCollectionEquality().hash(_images), const DeepCollectionEquality().hash(_tags), const DeepCollectionEquality().hash(_cookingHistories), cookingCount, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith => __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);
}

abstract class _Recipe extends Recipe {
  const factory _Recipe({required final RecipeId id, required final String title, required final String description, required final Uri? url, required final List<Content> images, required final List<Tag> tags, required final List<DateTime> cookingHistories, required final int cookingCount, required final DateTime createdAt, required final DateTime updatedAt}) = _$_Recipe;

  const _Recipe._() : super._();

  @override
  RecipeId get id;

  @override
  String get title;

  @override
  String get description;

  @override
  Uri? get url;

  @override
  List<Content> get images;

  @override
  List<Tag> get tags;

  @override
  List<DateTime> get cookingHistories;

  @override
  int get cookingCount;

  @override
  DateTime get createdAt;

  @override
  DateTime get updatedAt;

  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith => throw _privateConstructorUsedError;
}
