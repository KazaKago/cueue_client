// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$TagOrderRequestCopyWithImpl<$Res, TagOrderRequest>;
  @useResult
  $Res call({@JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class _$TagOrderRequestCopyWithImpl<$Res, $Val extends TagOrderRequest>
    implements $TagOrderRequestCopyWith<$Res> {
  _$TagOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagIds = null,
  }) {
    return _then(_value.copyWith(
      tagIds: null == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagOrderRequestImplCopyWith<$Res>
    implements $TagOrderRequestCopyWith<$Res> {
  factory _$$TagOrderRequestImplCopyWith(_$TagOrderRequestImpl value,
          $Res Function(_$TagOrderRequestImpl) then) =
      __$$TagOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'tag_ids') List<int> tagIds});
}

/// @nodoc
class __$$TagOrderRequestImplCopyWithImpl<$Res>
    extends _$TagOrderRequestCopyWithImpl<$Res, _$TagOrderRequestImpl>
    implements _$$TagOrderRequestImplCopyWith<$Res> {
  __$$TagOrderRequestImplCopyWithImpl(
      _$TagOrderRequestImpl _value, $Res Function(_$TagOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagIds = null,
  }) {
    return _then(_$TagOrderRequestImpl(
      tagIds: null == tagIds
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagOrderRequestImpl implements _TagOrderRequest {
  const _$TagOrderRequestImpl(
      {@JsonKey(name: 'tag_ids') required final List<int> tagIds})
      : _tagIds = tagIds;

  factory _$TagOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagOrderRequestImplFromJson(json);

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
    return 'TagOrderRequest(tagIds: $tagIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagOrderRequestImpl &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tagIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagOrderRequestImplCopyWith<_$TagOrderRequestImpl> get copyWith =>
      __$$TagOrderRequestImplCopyWithImpl<_$TagOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _TagOrderRequest implements TagOrderRequest {
  const factory _TagOrderRequest(
          {@JsonKey(name: 'tag_ids') required final List<int> tagIds}) =
      _$TagOrderRequestImpl;

  factory _TagOrderRequest.fromJson(Map<String, dynamic> json) =
      _$TagOrderRequestImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'tag_ids')
  List<int> get tagIds;
  @override
  @JsonKey(ignore: true)
  _$$TagOrderRequestImplCopyWith<_$TagOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
