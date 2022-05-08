// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'content_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContentRegistration {
  Uint8List get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ContentRegistrationCopyWith<ContentRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentRegistrationCopyWith<$Res> {
  factory $ContentRegistrationCopyWith(
          ContentRegistration value, $Res Function(ContentRegistration) then) =
      _$ContentRegistrationCopyWithImpl<$Res>;
  $Res call({Uint8List data});
}

/// @nodoc
class _$ContentRegistrationCopyWithImpl<$Res>
    implements $ContentRegistrationCopyWith<$Res> {
  _$ContentRegistrationCopyWithImpl(this._value, this._then);

  final ContentRegistration _value;
  // ignore: unused_field
  final $Res Function(ContentRegistration) _then;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc
abstract class _$$_ContentRegistrationCopyWith<$Res>
    implements $ContentRegistrationCopyWith<$Res> {
  factory _$$_ContentRegistrationCopyWith(_$_ContentRegistration value,
          $Res Function(_$_ContentRegistration) then) =
      __$$_ContentRegistrationCopyWithImpl<$Res>;
  @override
  $Res call({Uint8List data});
}

/// @nodoc
class __$$_ContentRegistrationCopyWithImpl<$Res>
    extends _$ContentRegistrationCopyWithImpl<$Res>
    implements _$$_ContentRegistrationCopyWith<$Res> {
  __$$_ContentRegistrationCopyWithImpl(_$_ContentRegistration _value,
      $Res Function(_$_ContentRegistration) _then)
      : super(_value, (v) => _then(v as _$_ContentRegistration));

  @override
  _$_ContentRegistration get _value => super._value as _$_ContentRegistration;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$_ContentRegistration(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Uint8List,
    ));
  }
}

/// @nodoc

class _$_ContentRegistration implements _ContentRegistration {
  const _$_ContentRegistration({required this.data});

  @override
  final Uint8List data;

  @override
  String toString() {
    return 'ContentRegistration(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentRegistration &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$_ContentRegistrationCopyWith<_$_ContentRegistration> get copyWith =>
      __$$_ContentRegistrationCopyWithImpl<_$_ContentRegistration>(
          this, _$identity);
}

abstract class _ContentRegistration implements ContentRegistration {
  const factory _ContentRegistration({required final Uint8List data}) =
      _$_ContentRegistration;

  @override
  Uint8List get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ContentRegistrationCopyWith<_$_ContentRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
