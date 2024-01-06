// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeRegistration {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Uri? get url => throw _privateConstructorUsedError;
  List<ContentKey> get imageKeys => throw _privateConstructorUsedError;
  List<TagId> get tagIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeRegistrationCopyWith<RecipeRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeRegistrationCopyWith<$Res> {
  factory $RecipeRegistrationCopyWith(
          RecipeRegistration value, $Res Function(RecipeRegistration) then) =
      _$RecipeRegistrationCopyWithImpl<$Res, RecipeRegistration>;
  @useResult
  $Res call(
      {String title,
      String description,
      Uri? url,
      List<ContentKey> imageKeys,
      List<TagId> tagIds});
}

/// @nodoc
class _$RecipeRegistrationCopyWithImpl<$Res, $Val extends RecipeRegistration>
    implements $RecipeRegistrationCopyWith<$Res> {
  _$RecipeRegistrationCopyWithImpl(this._value, this._then);

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
              as Uri?,
      imageKeys: null == imageKeys
          ? _value.imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<ContentKey>,
      tagIds: null == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagId>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeRegistrationImplCopyWith<$Res>
    implements $RecipeRegistrationCopyWith<$Res> {
  factory _$$RecipeRegistrationImplCopyWith(_$RecipeRegistrationImpl value,
          $Res Function(_$RecipeRegistrationImpl) then) =
      __$$RecipeRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String description,
      Uri? url,
      List<ContentKey> imageKeys,
      List<TagId> tagIds});
}

/// @nodoc
class __$$RecipeRegistrationImplCopyWithImpl<$Res>
    extends _$RecipeRegistrationCopyWithImpl<$Res, _$RecipeRegistrationImpl>
    implements _$$RecipeRegistrationImplCopyWith<$Res> {
  __$$RecipeRegistrationImplCopyWithImpl(_$RecipeRegistrationImpl _value,
      $Res Function(_$RecipeRegistrationImpl) _then)
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
    return _then(_$RecipeRegistrationImpl(
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
      imageKeys: null == imageKeys
          ? _value._imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<ContentKey>,
      tagIds: null == tagIds
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagId>,
    ));
  }
}

/// @nodoc

class _$RecipeRegistrationImpl implements _RecipeRegistration {
  const _$RecipeRegistrationImpl(
      {required this.title,
      required this.description,
      required this.url,
      required final List<ContentKey> imageKeys,
      required final List<TagId> tagIds})
      : _imageKeys = imageKeys,
        _tagIds = tagIds;

  @override
  final String title;
  @override
  final String description;
  @override
  final Uri? url;
  final List<ContentKey> _imageKeys;
  @override
  List<ContentKey> get imageKeys {
    if (_imageKeys is EqualUnmodifiableListView) return _imageKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageKeys);
  }

  final List<TagId> _tagIds;
  @override
  List<TagId> get tagIds {
    if (_tagIds is EqualUnmodifiableListView) return _tagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagIds);
  }

  @override
  String toString() {
    return 'RecipeRegistration(title: $title, description: $description, url: $url, imageKeys: $imageKeys, tagIds: $tagIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeRegistrationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other._imageKeys, _imageKeys) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

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
  _$$RecipeRegistrationImplCopyWith<_$RecipeRegistrationImpl> get copyWith =>
      __$$RecipeRegistrationImplCopyWithImpl<_$RecipeRegistrationImpl>(
          this, _$identity);
}

abstract class _RecipeRegistration implements RecipeRegistration {
  const factory _RecipeRegistration(
      {required final String title,
      required final String description,
      required final Uri? url,
      required final List<ContentKey> imageKeys,
      required final List<TagId> tagIds}) = _$RecipeRegistrationImpl;

  @override
  String get title;
  @override
  String get description;
  @override
  Uri? get url;
  @override
  List<ContentKey> get imageKeys;
  @override
  List<TagId> get tagIds;
  @override
  @JsonKey(ignore: true)
  _$$RecipeRegistrationImplCopyWith<_$RecipeRegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
