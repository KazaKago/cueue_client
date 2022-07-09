// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$RecipeRegistrationCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      Uri? url,
      List<ContentKey> imageKeys,
      List<TagId> tagIds});
}

/// @nodoc
class _$RecipeRegistrationCopyWithImpl<$Res>
    implements $RecipeRegistrationCopyWith<$Res> {
  _$RecipeRegistrationCopyWithImpl(this._value, this._then);

  final RecipeRegistration _value;
  // ignore: unused_field
  final $Res Function(RecipeRegistration) _then;

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
              as Uri?,
      imageKeys: imageKeys == freezed
          ? _value.imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<ContentKey>,
      tagIds: tagIds == freezed
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagId>,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeRegistrationCopyWith<$Res>
    implements $RecipeRegistrationCopyWith<$Res> {
  factory _$$_RecipeRegistrationCopyWith(_$_RecipeRegistration value,
          $Res Function(_$_RecipeRegistration) then) =
      __$$_RecipeRegistrationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      Uri? url,
      List<ContentKey> imageKeys,
      List<TagId> tagIds});
}

/// @nodoc
class __$$_RecipeRegistrationCopyWithImpl<$Res>
    extends _$RecipeRegistrationCopyWithImpl<$Res>
    implements _$$_RecipeRegistrationCopyWith<$Res> {
  __$$_RecipeRegistrationCopyWithImpl(
      _$_RecipeRegistration _value, $Res Function(_$_RecipeRegistration) _then)
      : super(_value, (v) => _then(v as _$_RecipeRegistration));

  @override
  _$_RecipeRegistration get _value => super._value as _$_RecipeRegistration;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? url = freezed,
    Object? imageKeys = freezed,
    Object? tagIds = freezed,
  }) {
    return _then(_$_RecipeRegistration(
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
      imageKeys: imageKeys == freezed
          ? _value._imageKeys
          : imageKeys // ignore: cast_nullable_to_non_nullable
              as List<ContentKey>,
      tagIds: tagIds == freezed
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagId>,
    ));
  }
}

/// @nodoc

class _$_RecipeRegistration implements _RecipeRegistration {
  const _$_RecipeRegistration(
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageKeys);
  }

  final List<TagId> _tagIds;
  @override
  List<TagId> get tagIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagIds);
  }

  @override
  String toString() {
    return 'RecipeRegistration(title: $title, description: $description, url: $url, imageKeys: $imageKeys, tagIds: $tagIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeRegistration &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality()
                .equals(other._imageKeys, _imageKeys) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(_imageKeys),
      const DeepCollectionEquality().hash(_tagIds));

  @JsonKey(ignore: true)
  @override
  _$$_RecipeRegistrationCopyWith<_$_RecipeRegistration> get copyWith =>
      __$$_RecipeRegistrationCopyWithImpl<_$_RecipeRegistration>(
          this, _$identity);
}

abstract class _RecipeRegistration implements RecipeRegistration {
  const factory _RecipeRegistration(
      {required final String title,
      required final String description,
      required final Uri? url,
      required final List<ContentKey> imageKeys,
      required final List<TagId> tagIds}) = _$_RecipeRegistration;

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
  _$$_RecipeRegistrationCopyWith<_$_RecipeRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
