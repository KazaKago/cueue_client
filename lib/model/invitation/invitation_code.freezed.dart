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
abstract class _$$InvitationCodeImplCopyWith<$Res>
    implements $InvitationCodeCopyWith<$Res> {
  factory _$$InvitationCodeImplCopyWith(_$InvitationCodeImpl value,
          $Res Function(_$InvitationCodeImpl) then) =
      __$$InvitationCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$InvitationCodeImplCopyWithImpl<$Res>
    extends _$InvitationCodeCopyWithImpl<$Res, _$InvitationCodeImpl>
    implements _$$InvitationCodeImplCopyWith<$Res> {
  __$$InvitationCodeImplCopyWithImpl(
      _$InvitationCodeImpl _value, $Res Function(_$InvitationCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$InvitationCodeImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvitationCodeImpl implements _InvitationCode {
  const _$InvitationCodeImpl(this.value);

  @override
  final String value;

  @override
  String toString() {
    return 'InvitationCode(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationCodeImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationCodeImplCopyWith<_$InvitationCodeImpl> get copyWith =>
      __$$InvitationCodeImplCopyWithImpl<_$InvitationCodeImpl>(
          this, _$identity);
}

abstract class _InvitationCode implements InvitationCode {
  const factory _InvitationCode(final String value) = _$InvitationCodeImpl;

  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$InvitationCodeImplCopyWith<_$InvitationCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
