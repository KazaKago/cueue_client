// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagRegistration {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagRegistrationCopyWith<TagRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagRegistrationCopyWith<$Res> {
  factory $TagRegistrationCopyWith(
          TagRegistration value, $Res Function(TagRegistration) then) =
      _$TagRegistrationCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$TagRegistrationCopyWithImpl<$Res>
    implements $TagRegistrationCopyWith<$Res> {
  _$TagRegistrationCopyWithImpl(this._value, this._then);

  final TagRegistration _value;
  // ignore: unused_field
  final $Res Function(TagRegistration) _then;

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
abstract class _$TagRegistrationCopyWith<$Res>
    implements $TagRegistrationCopyWith<$Res> {
  factory _$TagRegistrationCopyWith(
          _TagRegistration value, $Res Function(_TagRegistration) then) =
      __$TagRegistrationCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$TagRegistrationCopyWithImpl<$Res>
    extends _$TagRegistrationCopyWithImpl<$Res>
    implements _$TagRegistrationCopyWith<$Res> {
  __$TagRegistrationCopyWithImpl(
      _TagRegistration _value, $Res Function(_TagRegistration) _then)
      : super(_value, (v) => _then(v as _TagRegistration));

  @override
  _TagRegistration get _value => super._value as _TagRegistration;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_TagRegistration(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TagRegistration implements _TagRegistration {
  const _$_TagRegistration({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'TagRegistration(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagRegistration &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$TagRegistrationCopyWith<_TagRegistration> get copyWith =>
      __$TagRegistrationCopyWithImpl<_TagRegistration>(this, _$identity);
}

abstract class _TagRegistration implements TagRegistration {
  const factory _TagRegistration({required final String name}) =
      _$_TagRegistration;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TagRegistrationCopyWith<_TagRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
