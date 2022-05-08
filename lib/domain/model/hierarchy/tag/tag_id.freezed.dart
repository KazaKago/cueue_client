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
abstract class _$$_TagIdCopyWith<$Res> implements $TagIdCopyWith<$Res> {
  factory _$$_TagIdCopyWith(_$_TagId value, $Res Function(_$_TagId) then) =
      __$$_TagIdCopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$$_TagIdCopyWithImpl<$Res> extends _$TagIdCopyWithImpl<$Res>
    implements _$$_TagIdCopyWith<$Res> {
  __$$_TagIdCopyWithImpl(_$_TagId _value, $Res Function(_$_TagId) _then)
      : super(_value, (v) => _then(v as _$_TagId));

  @override
  _$_TagId get _value => super._value as _$_TagId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_TagId(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TagId extends _TagId {
  const _$_TagId(this.value) : super._();

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
            other is _$_TagId &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_TagIdCopyWith<_$_TagId> get copyWith =>
      __$$_TagIdCopyWithImpl<_$_TagId>(this, _$identity);
}

abstract class _TagId extends TagId {
  const factory _TagId(final int value) = _$_TagId;
  const _TagId._() : super._();

  @override
  int get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TagIdCopyWith<_$_TagId> get copyWith =>
      throw _privateConstructorUsedError;
}
