// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagOrderRequest _$TagOrderRequestFromJson(Map<String, dynamic> json) {
  return _TagOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$TagOrderRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagOrderRequestCopyWith<TagOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagOrderRequestCopyWith<$Res> {
  factory $TagOrderRequestCopyWith(
          TagOrderRequest value, $Res Function(TagOrderRequest) then) =
      _$TagOrderRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class _$TagOrderRequestCopyWithImpl<$Res>
    implements $TagOrderRequestCopyWith<$Res> {
  _$TagOrderRequestCopyWithImpl(this._value, this._then);

  final TagOrderRequest _value;
  // ignore: unused_field
  final $Res Function(TagOrderRequest) _then;

  @override
  $Res call({
    Object? tagIds = freezed,
  }) {
    return _then(_value.copyWith(
      tagIds: tagIds == freezed
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$TagOrderRequestCopyWith<$Res>
    implements $TagOrderRequestCopyWith<$Res> {
  factory _$TagOrderRequestCopyWith(
          _TagOrderRequest value, $Res Function(_TagOrderRequest) then) =
      __$TagOrderRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class __$TagOrderRequestCopyWithImpl<$Res>
    extends _$TagOrderRequestCopyWithImpl<$Res>
    implements _$TagOrderRequestCopyWith<$Res> {
  __$TagOrderRequestCopyWithImpl(
      _TagOrderRequest _value, $Res Function(_TagOrderRequest) _then)
      : super(_value, (v) => _then(v as _TagOrderRequest));

  @override
  _TagOrderRequest get _value => super._value as _TagOrderRequest;

  @override
  $Res call({
    Object? tagIds = freezed,
  }) {
    return _then(_TagOrderRequest(
      tagIds: tagIds == freezed
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagOrderRequest implements _TagOrderRequest {
  const _$_TagOrderRequest(
      {@JsonKey(name: 'tag_ids') required final List<int> tagIds})
      : _tagIds = tagIds;

  factory _$_TagOrderRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TagOrderRequestFromJson(json);

// ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  final List<int> _tagIds;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tagIds);
  }

  @override
  String toString() {
    return 'TagOrderRequest(tagIds: $tagIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagOrderRequest &&
            const DeepCollectionEquality().equals(other.tagIds, tagIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tagIds));

  @JsonKey(ignore: true)
  @override
  _$TagOrderRequestCopyWith<_TagOrderRequest> get copyWith =>
      __$TagOrderRequestCopyWithImpl<_TagOrderRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagOrderRequestToJson(this);
  }
}

abstract class _TagOrderRequest implements TagOrderRequest {
  const factory _TagOrderRequest(
          {@JsonKey(name: 'tag_ids') required final List<int> tagIds}) =
      _$_TagOrderRequest;

  factory _TagOrderRequest.fromJson(Map<String, dynamic> json) =
      _$_TagOrderRequest.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TagOrderRequestCopyWith<_TagOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}