// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentRequest _$ContentRequestFromJson(Map<String, dynamic> json) {
  return _ContentRequest.fromJson(json);
}

/// @nodoc
mixin _$ContentRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'data')
  String get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentRequestCopyWith<ContentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentRequestCopyWith<$Res> {
  factory $ContentRequestCopyWith(
          ContentRequest value, $Res Function(ContentRequest) then) =
      _$ContentRequestCopyWithImpl<$Res, ContentRequest>;
  @useResult
  $Res call({@JsonKey(name: 'data') String data});
}

/// @nodoc
class _$ContentRequestCopyWithImpl<$Res, $Val extends ContentRequest>
    implements $ContentRequestCopyWith<$Res> {
  _$ContentRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContentRequestCopyWith<$Res>
    implements $ContentRequestCopyWith<$Res> {
  factory _$$_ContentRequestCopyWith(
          _$_ContentRequest value, $Res Function(_$_ContentRequest) then) =
      __$$_ContentRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') String data});
}

/// @nodoc
class __$$_ContentRequestCopyWithImpl<$Res>
    extends _$ContentRequestCopyWithImpl<$Res, _$_ContentRequest>
    implements _$$_ContentRequestCopyWith<$Res> {
  __$$_ContentRequestCopyWithImpl(
      _$_ContentRequest _value, $Res Function(_$_ContentRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_ContentRequest(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentRequest implements _ContentRequest {
  const _$_ContentRequest({@JsonKey(name: 'data') required this.data});

  factory _$_ContentRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ContentRequestFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'data')
  final String data;

  @override
  String toString() {
    return 'ContentRequest(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentRequest &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContentRequestCopyWith<_$_ContentRequest> get copyWith =>
      __$$_ContentRequestCopyWithImpl<_$_ContentRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentRequestToJson(
      this,
    );
  }
}

abstract class _ContentRequest implements ContentRequest {
  const factory _ContentRequest(
      {@JsonKey(name: 'data') required final String data}) = _$_ContentRequest;

  factory _ContentRequest.fromJson(Map<String, dynamic> json) =
      _$_ContentRequest.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'data')
  String get data;
  @override
  @JsonKey(ignore: true)
  _$$_ContentRequestCopyWith<_$_ContentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
