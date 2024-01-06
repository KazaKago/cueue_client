// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContentKey {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentKeyCopyWith<ContentKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentKeyCopyWith<$Res> {
  factory $ContentKeyCopyWith(
          ContentKey value, $Res Function(ContentKey) then) =
      _$ContentKeyCopyWithImpl<$Res, ContentKey>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$ContentKeyCopyWithImpl<$Res, $Val extends ContentKey>
    implements $ContentKeyCopyWith<$Res> {
  _$ContentKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentKeyImplCopyWith<$Res>
    implements $ContentKeyCopyWith<$Res> {
  factory _$$ContentKeyImplCopyWith(
          _$ContentKeyImpl value, $Res Function(_$ContentKeyImpl) then) =
      __$$ContentKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$ContentKeyImplCopyWithImpl<$Res>
    extends _$ContentKeyCopyWithImpl<$Res, _$ContentKeyImpl>
    implements _$$ContentKeyImplCopyWith<$Res> {
  __$$ContentKeyImplCopyWithImpl(
      _$ContentKeyImpl _value, $Res Function(_$ContentKeyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ContentKeyImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ContentKeyImpl implements _ContentKey {
  const _$ContentKeyImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'ContentKey(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentKeyImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentKeyImplCopyWith<_$ContentKeyImpl> get copyWith =>
      __$$ContentKeyImplCopyWithImpl<_$ContentKeyImpl>(this, _$identity);
}

abstract class _ContentKey implements ContentKey {
  const factory _ContentKey(final String value) = _$ContentKeyImpl;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$ContentKeyImplCopyWith<_$ContentKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
