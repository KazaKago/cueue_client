// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagRequest _$TagRequestFromJson(Map<String, dynamic> json) {
  return _TagRequest.fromJson(json);
}

/// @nodoc
class _$TagRequestTearOff {
  const _$TagRequestTearOff();

  _TagRequest call({@JsonKey(name: 'name') required String name}) {
    return _TagRequest(
      name: name,
    );
  }

  TagRequest fromJson(Map<String, Object?> json) {
    return TagRequest.fromJson(json);
  }
}

/// @nodoc
const $TagRequest = _$TagRequestTearOff();

/// @nodoc
mixin _$TagRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagRequestCopyWith<TagRequest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagRequestCopyWith<$Res> {
  factory $TagRequestCopyWith(TagRequest value, $Res Function(TagRequest) then) = _$TagRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class _$TagRequestCopyWithImpl<$Res> implements $TagRequestCopyWith<$Res> {
  _$TagRequestCopyWithImpl(this._value, this._then);

  final TagRequest _value;
  // ignore: unused_field
  final $Res Function(TagRequest) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TagRequestCopyWith<$Res> implements $TagRequestCopyWith<$Res> {
  factory _$TagRequestCopyWith(_TagRequest value, $Res Function(_TagRequest) then) = __$TagRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class __$TagRequestCopyWithImpl<$Res> extends _$TagRequestCopyWithImpl<$Res> implements _$TagRequestCopyWith<$Res> {
  __$TagRequestCopyWithImpl(_TagRequest _value, $Res Function(_TagRequest) _then) : super(_value, (v) => _then(v as _TagRequest));

  @override
  _TagRequest get _value => super._value as _TagRequest;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_TagRequest(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TagRequest implements _TagRequest {
  const _$_TagRequest({@JsonKey(name: 'name') required this.name});

  factory _$_TagRequest.fromJson(Map<String, dynamic> json) => _$$_TagRequestFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'TagRequest(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _TagRequest && const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$TagRequestCopyWith<_TagRequest> get copyWith => __$TagRequestCopyWithImpl<_TagRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagRequestToJson(this);
  }
}

abstract class _TagRequest implements TagRequest {
  const factory _TagRequest({@JsonKey(name: 'name') required String name}) = _$_TagRequest;

  factory _TagRequest.fromJson(Map<String, dynamic> json) = _$_TagRequest.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$TagRequestCopyWith<_TagRequest> get copyWith => throw _privateConstructorUsedError;
}
