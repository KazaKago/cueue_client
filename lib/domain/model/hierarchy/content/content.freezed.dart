// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ContentTearOff {
  const _$ContentTearOff();

  _Content call({required ContentKey key, required Uri url}) {
    return _Content(
      key: key,
      url: url,
    );
  }
}

/// @nodoc
const $Content = _$ContentTearOff();

/// @nodoc
mixin _$Content {
  ContentKey get key => throw _privateConstructorUsedError;
  Uri get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) = _$ContentCopyWithImpl<$Res>;
  $Res call({ContentKey key, Uri url});

  $ContentKeyCopyWith<$Res> get key;
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  final Content _value;
  // ignore: unused_field
  final $Res Function(Content) _then;

  @override
  $Res call({
    Object? key = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as ContentKey,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }

  @override
  $ContentKeyCopyWith<$Res> get key {
    return $ContentKeyCopyWith<$Res>(_value.key, (value) {
      return _then(_value.copyWith(key: value));
    });
  }
}

/// @nodoc
abstract class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) then) = __$ContentCopyWithImpl<$Res>;
  @override
  $Res call({ContentKey key, Uri url});

  @override
  $ContentKeyCopyWith<$Res> get key;
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> extends _$ContentCopyWithImpl<$Res> implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(_Content _value, $Res Function(_Content) _then) : super(_value, (v) => _then(v as _Content));

  @override
  _Content get _value => super._value as _Content;

  @override
  $Res call({
    Object? key = freezed,
    Object? url = freezed,
  }) {
    return _then(_Content(
      key: key == freezed
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as ContentKey,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_Content implements _Content {
  const _$_Content({required this.key, required this.url});

  @override
  final ContentKey key;
  @override
  final Uri url;

  @override
  String toString() {
    return 'Content(key: $key, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _Content && const DeepCollectionEquality().equals(other.key, key) && const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(key), const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$ContentCopyWith<_Content> get copyWith => __$ContentCopyWithImpl<_Content>(this, _$identity);
}

abstract class _Content implements Content {
  const factory _Content({required ContentKey key, required Uri url}) = _$_Content;

  @override
  ContentKey get key;
  @override
  Uri get url;
  @override
  @JsonKey(ignore: true)
  _$ContentCopyWith<_Content> get copyWith => throw _privateConstructorUsedError;
}
