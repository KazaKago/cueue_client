// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invitation_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InvitationCode {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InvitationCodeCopyWith<InvitationCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCodeCopyWith<$Res> {
  factory $InvitationCodeCopyWith(
          InvitationCode value, $Res Function(InvitationCode) then) =
      _$InvitationCodeCopyWithImpl<$Res, InvitationCode>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class _$InvitationCodeCopyWithImpl<$Res, $Val extends InvitationCode>
    implements $InvitationCodeCopyWith<$Res> {
  _$InvitationCodeCopyWithImpl(this._value, this._then);

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
abstract class _$$_InvitationCodeCopyWith<$Res>
    implements $InvitationCodeCopyWith<$Res> {
  factory _$$_InvitationCodeCopyWith(
          _$_InvitationCode value, $Res Function(_$_InvitationCode) then) =
      __$$_InvitationCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$_InvitationCodeCopyWithImpl<$Res>
    extends _$InvitationCodeCopyWithImpl<$Res, _$_InvitationCode>
    implements _$$_InvitationCodeCopyWith<$Res> {
  __$$_InvitationCodeCopyWithImpl(
      _$_InvitationCode _value, $Res Function(_$_InvitationCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_InvitationCode(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InvitationCode implements _InvitationCode {
  const _$_InvitationCode(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'InvitationCode(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InvitationCode &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvitationCodeCopyWith<_$_InvitationCode> get copyWith =>
      __$$_InvitationCodeCopyWithImpl<_$_InvitationCode>(this, _$identity);
}

abstract class _InvitationCode implements InvitationCode {
  const factory _InvitationCode(final String value) = _$_InvitationCode;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_InvitationCodeCopyWith<_$_InvitationCode> get copyWith =>
      throw _privateConstructorUsedError;
}
