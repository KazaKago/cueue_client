// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeSummaryResponse _$RecipeSummaryResponseFromJson(
    Map<String, dynamic> json) {
  return _RecipeSummaryResponse.fromJson(json);
}

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
      _$RecipeSummaryResponseCopyWithImpl<$Res, RecipeSummaryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') ContentResponse? image,
      @JsonKey(name: 'last_cooking_at') String? lastCookingAt});

  $ContentResponseCopyWith<$Res>? get image;
}

/// @nodoc
class _$RecipeSummaryResponseCopyWithImpl<$Res,
        $Val extends RecipeSummaryResponse>
    implements $RecipeSummaryResponseCopyWith<$Res> {
  _$RecipeSummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = freezed,
    Object? lastCookingAt = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
      lastCookingAt: freezed == lastCookingAt
          ? _value.lastCookingAt
          : lastCookingAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentResponseCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ContentResponseCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeSummaryResponseImplCopyWith<$Res>
    implements $RecipeSummaryResponseCopyWith<$Res> {
  factory _$$RecipeSummaryResponseImplCopyWith(
          _$RecipeSummaryResponseImpl value,
          $Res Function(_$RecipeSummaryResponseImpl) then) =
      __$$RecipeSummaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'image') ContentResponse? image,
      @JsonKey(name: 'last_cooking_at') String? lastCookingAt});

  @override
  $ContentResponseCopyWith<$Res>? get image;
}

/// @nodoc
class __$$RecipeSummaryResponseImplCopyWithImpl<$Res>
    extends _$RecipeSummaryResponseCopyWithImpl<$Res,
        _$RecipeSummaryResponseImpl>
    implements _$$RecipeSummaryResponseImplCopyWith<$Res> {
  __$$RecipeSummaryResponseImplCopyWithImpl(_$RecipeSummaryResponseImpl _value,
      $Res Function(_$RecipeSummaryResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? image = freezed,
    Object? lastCookingAt = freezed,
  }) {
    return _then(_$RecipeSummaryResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
      lastCookingAt: freezed == lastCookingAt
          ? _value.lastCookingAt
          : lastCookingAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeSummaryResponseImpl implements _RecipeSummaryResponse {
  const _$RecipeSummaryResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'last_cooking_at') required this.lastCookingAt});

  factory _$RecipeSummaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeSummaryResponseImplFromJson(json);

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
  @JsonKey(name: 'image')
  final ContentResponse? image;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'last_cooking_at')
  final String? lastCookingAt;

  @override
  String toString() {
    return 'RecipeSummaryResponse(id: $id, title: $title, image: $image, lastCookingAt: $lastCookingAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeSummaryResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lastCookingAt, lastCookingAt) ||
                other.lastCookingAt == lastCookingAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image, lastCookingAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeSummaryResponseImplCopyWith<_$RecipeSummaryResponseImpl>
      get copyWith => __$$RecipeSummaryResponseImplCopyWithImpl<
          _$RecipeSummaryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeSummaryResponseImplToJson(
      this,
    );
  }
}

abstract class _RecipeSummaryResponse implements RecipeSummaryResponse {
  const factory _RecipeSummaryResponse(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'image') required final ContentResponse? image,
      @JsonKey(name: 'last_cooking_at')
      required final String? lastCookingAt}) = _$RecipeSummaryResponseImpl;

  factory _RecipeSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$RecipeSummaryResponseImpl.fromJson;

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
  _$$RecipeSummaryResponseImplCopyWith<_$RecipeSummaryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
