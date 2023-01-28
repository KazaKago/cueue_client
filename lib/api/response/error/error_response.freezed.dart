// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'error_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) {
  return _ErrorResponse.fromJson(json);
}

/// @nodoc
mixin _$ErrorResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ErrorResponseCopyWith<ErrorResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErrorResponseCopyWith<$Res> {
  factory $ErrorResponseCopyWith(ErrorResponse value, $Res Function(ErrorResponse) then) = _$ErrorResponseCopyWithImpl<$Res, ErrorResponse>;

  @useResult
  $Res call({@JsonKey(name: 'name') String name, @JsonKey(name: 'message') String message});
}

/// @nodoc
class _$ErrorResponseCopyWithImpl<$Res, $Val extends ErrorResponse> implements $ErrorResponseCopyWith<$Res> {
  _$ErrorResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ErrorResponseCopyWith<$Res> implements $ErrorResponseCopyWith<$Res> {
  factory _$$_ErrorResponseCopyWith(_$_ErrorResponse value, $Res Function(_$_ErrorResponse) then) = __$$_ErrorResponseCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String name, @JsonKey(name: 'message') String message});
}

/// @nodoc
class __$$_ErrorResponseCopyWithImpl<$Res> extends _$ErrorResponseCopyWithImpl<$Res, _$_ErrorResponse> implements _$$_ErrorResponseCopyWith<$Res> {
  __$$_ErrorResponseCopyWithImpl(_$_ErrorResponse _value, $Res Function(_$_ErrorResponse) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? message = null,
  }) {
    return _then(_$_ErrorResponse(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ErrorResponse implements _ErrorResponse {
  const _$_ErrorResponse({@JsonKey(name: 'name') required this.name, @JsonKey(name: 'message') required this.message});

  factory _$_ErrorResponse.fromJson(Map<String, dynamic> json) => _$$_ErrorResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String name;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'message')
  final String message;

  @override
  String toString() {
    return 'ErrorResponse(name: $name, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_ErrorResponse && (identical(other.name, name) || other.name == name) && (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorResponseCopyWith<_$_ErrorResponse> get copyWith => __$$_ErrorResponseCopyWithImpl<_$_ErrorResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ErrorResponseToJson(
      this,
    );
  }
}

abstract class _ErrorResponse implements ErrorResponse {
  const factory _ErrorResponse({@JsonKey(name: 'name') required final String name, @JsonKey(name: 'message') required final String message}) = _$_ErrorResponse;

  factory _ErrorResponse.fromJson(Map<String, dynamic> json) = _$_ErrorResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'message')
  String get message;

  @override
  @JsonKey(ignore: true)
  _$$_ErrorResponseCopyWith<_$_ErrorResponse> get copyWith => throw _privateConstructorUsedError;
}
