// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$TagRegistrationCopyWithImpl<$Res, TagRegistration>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$TagRegistrationCopyWithImpl<$Res, $Val extends TagRegistration>
    implements $TagRegistrationCopyWith<$Res> {
  _$TagRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagRegistrationCopyWith<$Res>
    implements $TagRegistrationCopyWith<$Res> {
  factory _$$_TagRegistrationCopyWith(
          _$_TagRegistration value, $Res Function(_$_TagRegistration) then) =
      __$$_TagRegistrationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_TagRegistrationCopyWithImpl<$Res>
    extends _$TagRegistrationCopyWithImpl<$Res, _$_TagRegistration>
    implements _$$_TagRegistrationCopyWith<$Res> {
  __$$_TagRegistrationCopyWithImpl(
      _$_TagRegistration _value, $Res Function(_$_TagRegistration) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_TagRegistration(
      name: null == name
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
            other is _$_TagRegistration &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagRegistrationCopyWith<_$_TagRegistration> get copyWith =>
      __$$_TagRegistrationCopyWithImpl<_$_TagRegistration>(this, _$identity);
}

abstract class _TagRegistration implements TagRegistration {
  const factory _TagRegistration({required final String name}) =
      _$_TagRegistration;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_TagRegistrationCopyWith<_$_TagRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
