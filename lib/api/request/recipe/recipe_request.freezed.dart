// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeRequest _$RecipeRequestFromJson(Map<String, dynamic> json) {
  return _RecipeRequest.fromJson(json);
}

/// @nodoc
mixin _$RecipeRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'title')
  String get title =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'description')
  String get description =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'url')
  String? get url =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'image_keys')
  List<String> get imageKeys =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeRequestCopyWith<RecipeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeRequestCopyWith<$Res> {
  factory $RecipeRequestCopyWith(
          RecipeRequest value, $Res Function(RecipeRequest) then) =
      _$RecipeRequestCopyWithImpl<$Res, RecipeRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'image_keys') List<String> imageKeys,
      @JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class _$RecipeRequestCopyWithImpl<$Res, $Val extends RecipeRequest>
    implements $RecipeRequestCopyWith<$Res> {
  _$RecipeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? url = freezed,
    Object? imageKeys = null,
    Object? tagIds = null,
  }) {
    return _then(_value.copyWith(
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
      imageKeys: null == imageKeys
          ? _value.imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagIds: null == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeRequestImplCopyWith<$Res>
    implements $RecipeRequestCopyWith<$Res> {
  factory _$$RecipeRequestImplCopyWith(
          _$RecipeRequestImpl value, $Res Function(_$RecipeRequestImpl) then) =
      __$$RecipeRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'image_keys') List<String> imageKeys,
      @JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class __$$RecipeRequestImplCopyWithImpl<$Res>
    extends _$RecipeRequestCopyWithImpl<$Res, _$RecipeRequestImpl>
    implements _$$RecipeRequestImplCopyWith<$Res> {
  __$$RecipeRequestImplCopyWithImpl(
      _$RecipeRequestImpl _value, $Res Function(_$RecipeRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? url = freezed,
    Object? imageKeys = null,
    Object? tagIds = null,
  }) {
    return _then(_$RecipeRequestImpl(
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
      imageKeys: null == imageKeys
          ? _value._imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagIds: null == tagIds
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeRequestImpl implements _RecipeRequest {
  const _$RecipeRequestImpl(
      {@JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'image_keys') required final List<String> imageKeys,
      @JsonKey(name: 'tag_ids') required final List<int> tagIds})
      : _imageKeys = imageKeys,
        _tagIds = tagIds;

  factory _$RecipeRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeRequestImplFromJson(json);

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
  final List<String> _imageKeys;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'image_keys')
  List<String> get imageKeys {
    if (_imageKeys is EqualUnmodifiableListView) return _imageKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageKeys);
  }

// ignore: invalid_annotation_target
  final List<int> _tagIds;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds {
    if (_tagIds is EqualUnmodifiableListView) return _tagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagIds);
  }

  @override
  String toString() {
    return 'RecipeRequest(title: $title, description: $description, url: $url, imageKeys: $imageKeys, tagIds: $tagIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeRequestImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other._imageKeys, _imageKeys) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      url,
      const DeepCollectionEquality().hash(_imageKeys),
      const DeepCollectionEquality().hash(_tagIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeRequestImplCopyWith<_$RecipeRequestImpl> get copyWith =>
      __$$RecipeRequestImplCopyWithImpl<_$RecipeRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeRequestImplToJson(
      this,
    );
  }
}

abstract class _RecipeRequest implements RecipeRequest {
  const factory _RecipeRequest(
          {@JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'description') required final String description,
          @JsonKey(name: 'url') required final String? url,
          @JsonKey(name: 'image_keys') required final List<String> imageKeys,
          @JsonKey(name: 'tag_ids') required final List<int> tagIds}) =
      _$RecipeRequestImpl;

  factory _RecipeRequest.fromJson(Map<String, dynamic> json) =
      _$RecipeRequestImpl.fromJson;

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
  @JsonKey(name: 'image_keys')
  List<String> get imageKeys;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds;
  @override
  @JsonKey(ignore: true)
  _$$RecipeRequestImplCopyWith<_$RecipeRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
