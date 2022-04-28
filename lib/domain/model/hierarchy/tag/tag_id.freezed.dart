// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagId {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagIdCopyWith<TagId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagIdCopyWith<$Res> {
  factory $TagIdCopyWith(TagId value, $Res Function(TagId) then) =
      _$TagIdCopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$TagIdCopyWithImpl<$Res> implements $TagIdCopyWith<$Res> {
  _$TagIdCopyWithImpl(this._value, this._then);

  final TagId _value;
  // ignore: unused_field
  final $Res Function(TagId) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$TagIdCopyWith<$Res> implements $TagIdCopyWith<$Res> {
  factory _$TagIdCopyWith(_TagId value, $Res Function(_TagId) then) =
      __$TagIdCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$TagIdCopyWithImpl<$Res> extends _$TagIdCopyWithImpl<$Res>
    implements _$TagIdCopyWith<$Res> {
  __$TagIdCopyWithImpl(_TagId _value, $Res Function(_TagId) _then)
      : super(_value, (v) => _then(v as _TagId));

  @override
  _TagId get _value => super._value as _TagId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_TagId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TagId implements _TagId {
  const _$_TagId(this.value);

  @override
  final int value;

  @override
  String toString() {
    return 'TagId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagId &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$TagIdCopyWith<_TagId> get copyWith =>
      __$TagIdCopyWithImpl<_TagId>(this, _$identity);
}

abstract class _TagId implements TagId {
  const factory _TagId(final int value) = _$_TagId;

  @override
  int get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TagIdCopyWith<_TagId> get copyWith => throw _privateConstructorUsedError;
}
