// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentResponse _$ContentResponseFromJson(Map<String, dynamic> json) {
  return _ContentResponse.fromJson(json);
}

/// @nodoc
mixin _$ContentResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'key')
  String get key =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentResponseCopyWith<ContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentResponseCopyWith<$Res> {
  factory $ContentResponseCopyWith(
          ContentResponse value, $Res Function(ContentResponse) then) =
      _$ContentResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'key') String key, @JsonKey(name: 'url') String url});
}

/// @nodoc
class _$ContentResponseCopyWithImpl<$Res>
    implements $ContentResponseCopyWith<$Res> {
  _$ContentResponseCopyWithImpl(this._value, this._then);

  final ContentResponse _value;
  // ignore: unused_field
  final $Res Function(ContentResponse) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ContentResponseCopyWith<$Res>
    implements $ContentResponseCopyWith<$Res> {
  factory _$$_ContentResponseCopyWith(
          _$_ContentResponse value, $Res Function(_$_ContentResponse) then) =
      __$$_ContentResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'key') String key, @JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$_ContentResponseCopyWithImpl<$Res>
    extends _$ContentResponseCopyWithImpl<$Res>
    implements _$$_ContentResponseCopyWith<$Res> {
  __$$_ContentResponseCopyWithImpl(
      _$_ContentResponse _value, $Res Function(_$_ContentResponse) _then)
      : super(_value, (v) => _then(v as _$_ContentResponse));

  @override
  _$_ContentResponse get _value => super._value as _$_ContentResponse;

  @override
  $Res call({
    Object? key = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_ContentResponse(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentResponse implements _ContentResponse {
  const _$_ContentResponse(
      {@JsonKey(name: 'key') required this.key,
      @JsonKey(name: 'url') required this.url});

  factory _$_ContentResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ContentResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'key')
  final String key;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString() {
    return 'ContentResponse(key: $key, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentResponse &&
            const DeepCollectionEquality().equals(other.key, key) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(key),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$$_ContentResponseCopyWith<_$_ContentResponse> get copyWith =>
      __$$_ContentResponseCopyWithImpl<_$_ContentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentResponseToJson(this);
  }
}

abstract class _ContentResponse implements ContentResponse {
  const factory _ContentResponse(
      {@JsonKey(name: 'key') required final String key,
      @JsonKey(name: 'url') required final String url}) = _$_ContentResponse;

  factory _ContentResponse.fromJson(Map<String, dynamic> json) =
      _$_ContentResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'key')
  String get key => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContentResponseCopyWith<_$_ContentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
