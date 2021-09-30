// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeRequest _$RecipeRequestFromJson(Map<String, dynamic> json) {
  return _RecipeRequest.fromJson(json);
}

/// @nodoc
class _$RecipeRequestTearOff {
  const _$RecipeRequestTearOff();

  _RecipeRequest call(
      {@JsonKey(name: 'title') required String title,
      @JsonKey(name: 'description') required String description,
      @JsonKey(name: 'url') required String? url,
      @JsonKey(name: 'image_keys') required List<String> imageKeys,
      @JsonKey(name: 'tag_ids') required List<int> tagIds}) {
    return _RecipeRequest(
      title: title,
      description: description,
      url: url,
      imageKeys: imageKeys,
      tagIds: tagIds,
    );
  }

  RecipeRequest fromJson(Map<String, Object> json) {
    return RecipeRequest.fromJson(json);
  }
}

/// @nodoc
const $RecipeRequest = _$RecipeRequestTearOff();

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
      _$RecipeRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'image_keys') List<String> imageKeys,
      @JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class _$RecipeRequestCopyWithImpl<$Res>
    implements $RecipeRequestCopyWith<$Res> {
  _$RecipeRequestCopyWithImpl(this._value, this._then);

  final RecipeRequest _value;
  // ignore: unused_field
  final $Res Function(RecipeRequest) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? imageKeys = freezed,
    Object? tagIds = freezed,
  }) {
    return _then(_value.copyWith(
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
      imageKeys: imageKeys == freezed
          ? _value.imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagIds: tagIds == freezed
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$RecipeRequestCopyWith<$Res>
    implements $RecipeRequestCopyWith<$Res> {
  factory _$RecipeRequestCopyWith(
          _RecipeRequest value, $Res Function(_RecipeRequest) then) =
      __$RecipeRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'title') String title,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'image_keys') List<String> imageKeys,
      @JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class __$RecipeRequestCopyWithImpl<$Res>
    extends _$RecipeRequestCopyWithImpl<$Res>
    implements _$RecipeRequestCopyWith<$Res> {
  __$RecipeRequestCopyWithImpl(
      _RecipeRequest _value, $Res Function(_RecipeRequest) _then)
      : super(_value, (v) => _then(v as _RecipeRequest));

  @override
  _RecipeRequest get _value => super._value as _RecipeRequest;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? imageKeys = freezed,
    Object? tagIds = freezed,
  }) {
    return _then(_RecipeRequest(
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
      imageKeys: imageKeys == freezed
          ? _value.imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tagIds: tagIds == freezed
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeRequest implements _RecipeRequest {
  const _$_RecipeRequest(
      {@JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'image_keys') required this.imageKeys,
      @JsonKey(name: 'tag_ids') required this.tagIds});

  factory _$_RecipeRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeRequestFromJson(json);

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
  @JsonKey(name: 'image_keys')
  final List<String> imageKeys;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  final List<int> tagIds;

  @override
  String toString() {
    return 'RecipeRequest(title: $title, description: $description, url: $url, imageKeys: $imageKeys, tagIds: $tagIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecipeRequest &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.imageKeys, imageKeys) ||
                const DeepCollectionEquality()
                    .equals(other.imageKeys, imageKeys)) &&
            (identical(other.tagIds, tagIds) ||
                const DeepCollectionEquality().equals(other.tagIds, tagIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(imageKeys) ^
      const DeepCollectionEquality().hash(tagIds);

  @JsonKey(ignore: true)
  @override
  _$RecipeRequestCopyWith<_RecipeRequest> get copyWith =>
      __$RecipeRequestCopyWithImpl<_RecipeRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeRequestToJson(this);
  }
}

abstract class _RecipeRequest implements RecipeRequest {
  const factory _RecipeRequest(
      {@JsonKey(name: 'title') required String title,
      @JsonKey(name: 'description') required String description,
      @JsonKey(name: 'url') required String? url,
      @JsonKey(name: 'image_keys') required List<String> imageKeys,
      @JsonKey(name: 'tag_ids') required List<int> tagIds}) = _$_RecipeRequest;

  factory _RecipeRequest.fromJson(Map<String, dynamic> json) =
      _$_RecipeRequest.fromJson;

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
  @JsonKey(name: 'image_keys')
  List<String> get imageKeys => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecipeRequestCopyWith<_RecipeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
