// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res>;
  $Res call(
      {RecipeId id,
      String title,
      String description,
      Uri? url,
      List<Content> images,
      List<Tag> tags,
      List<DateTime> cookingHistories,
      int cookingCount,
      DateTime createdAt,
      DateTime updatedAt});

  $RecipeIdCopyWith<$Res> get id;
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  final Recipe _value;
  // ignore: unused_field
  final $Res Function(Recipe) _then;

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
              as RecipeId,
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
              as Uri?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      cookingHistories: cookingHistories == freezed
          ? _value.cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      cookingCount: cookingCount == freezed
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $RecipeIdCopyWith<$Res> get id {
    return $RecipeIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) then) =
      __$RecipeCopyWithImpl<$Res>;
  @override
  $Res call(
      {RecipeId id,
      String title,
      String description,
      Uri? url,
      List<Content> images,
      List<Tag> tags,
      List<DateTime> cookingHistories,
      int cookingCount,
      DateTime createdAt,
      DateTime updatedAt});

  @override
  $RecipeIdCopyWith<$Res> get id;
}

/// @nodoc
class __$RecipeCopyWithImpl<$Res> extends _$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(_Recipe _value, $Res Function(_Recipe) _then)
      : super(_value, (v) => _then(v as _Recipe));

  @override
  _Recipe get _value => super._value as _Recipe;

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
    return _then(_Recipe(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as RecipeId,
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
              as Uri?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Content>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      cookingHistories: cookingHistories == freezed
          ? _value.cookingHistories
          : cookingHistories // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      cookingCount: cookingCount == freezed
          ? _value.cookingCount
          : cookingCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Recipe extends _Recipe {
  const _$_Recipe(
      {required this.id,
      required this.title,
      required this.description,
      required this.url,
      required final List<Content> images,
      required final List<Tag> tags,
      required final List<DateTime> cookingHistories,
      required this.cookingCount,
      required this.createdAt,
      required this.updatedAt})
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  final List<Tag> _tags;
  @override
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  final List<DateTime> _cookingHistories;
  @override
  List<DateTime> get cookingHistories {
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recipe &&
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
  _$RecipeCopyWith<_Recipe> get copyWith =>
      __$RecipeCopyWithImpl<_Recipe>(this, _$identity);
}

abstract class _Recipe extends Recipe {
  const factory _Recipe(
      {required final RecipeId id,
      required final String title,
      required final String description,
      required final Uri? url,
      required final List<Content> images,
      required final List<Tag> tags,
      required final List<DateTime> cookingHistories,
      required final int cookingCount,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$_Recipe;
  const _Recipe._() : super._();

  @override
  RecipeId get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  Uri? get url => throw _privateConstructorUsedError;
  @override
  List<Content> get images => throw _privateConstructorUsedError;
  @override
  List<Tag> get tags => throw _privateConstructorUsedError;
  @override
  List<DateTime> get cookingHistories => throw _privateConstructorUsedError;
  @override
  int get cookingCount => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecipeCopyWith<_Recipe> get copyWith => throw _privateConstructorUsedError;
}
