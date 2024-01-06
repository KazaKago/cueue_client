// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagRequest _$TagRequestFromJson(Map<String, dynamic> json) {
  return _TagRequest.fromJson(json);
}

/// @nodoc
mixin _$TagRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagRequestCopyWith<TagRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagRequestCopyWith<$Res> {
  factory $TagRequestCopyWith(
          TagRequest value, $Res Function(TagRequest) then) =
      _$TagRequestCopyWithImpl<$Res, TagRequest>;
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class _$TagRequestCopyWithImpl<$Res, $Val extends TagRequest>
    implements $TagRequestCopyWith<$Res> {
  _$TagRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagRequestImplCopyWith<$Res>
    implements $TagRequestCopyWith<$Res> {
  factory _$$TagRequestImplCopyWith(
          _$TagRequestImpl value, $Res Function(_$TagRequestImpl) then) =
      __$$TagRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$TagRequestImplCopyWithImpl<$Res>
    extends _$TagRequestCopyWithImpl<$Res, _$TagRequestImpl>
    implements _$$TagRequestImplCopyWith<$Res> {
  __$$TagRequestImplCopyWithImpl(
      _$TagRequestImpl _value, $Res Function(_$TagRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$TagRequestImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagRequestImpl implements _TagRequest {
  const _$TagRequestImpl({@JsonKey(name: 'name') required this.name});

  factory _$TagRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagRequestImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'TagRequest(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagRequestImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagRequestImplCopyWith<_$TagRequestImpl> get copyWith =>
      __$$TagRequestImplCopyWithImpl<_$TagRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagRequestImplToJson(
      this,
    );
  }
}

abstract class _TagRequest implements TagRequest {
  const factory _TagRequest(
      {@JsonKey(name: 'name') required final String name}) = _$TagRequestImpl;

  factory _TagRequest.fromJson(Map<String, dynamic> json) =
      _$TagRequestImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TagRequestImplCopyWith<_$TagRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
