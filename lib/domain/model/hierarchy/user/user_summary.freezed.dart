// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserSummary {
  UserId get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSummaryCopyWith<UserSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSummaryCopyWith<$Res> {
  factory $UserSummaryCopyWith(
          UserSummary value, $Res Function(UserSummary) then) =
      _$UserSummaryCopyWithImpl<$Res>;
  $Res call({UserId id});

  $UserIdCopyWith<$Res> get id;
}

/// @nodoc
class _$UserSummaryCopyWithImpl<$Res> implements $UserSummaryCopyWith<$Res> {
  _$UserSummaryCopyWithImpl(this._value, this._then);

  final UserSummary _value;
  // ignore: unused_field
  final $Res Function(UserSummary) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
    ));
  }

  @override
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserSummaryCopyWith<$Res>
    implements $UserSummaryCopyWith<$Res> {
  factory _$$_UserSummaryCopyWith(
          _$_UserSummary value, $Res Function(_$_UserSummary) then) =
      __$$_UserSummaryCopyWithImpl<$Res>;
  @override
  $Res call({UserId id});

  @override
  $UserIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_UserSummaryCopyWithImpl<$Res> extends _$UserSummaryCopyWithImpl<$Res>
    implements _$$_UserSummaryCopyWith<$Res> {
  __$$_UserSummaryCopyWithImpl(
      _$_UserSummary _value, $Res Function(_$_UserSummary) _then)
      : super(_value, (v) => _then(v as _$_UserSummary));

  @override
  _$_UserSummary get _value => super._value as _$_UserSummary;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_UserSummary(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
    ));
  }
}

/// @nodoc

class _$_UserSummary implements _UserSummary {
  const _$_UserSummary({required this.id});

  @override
  final UserId id;

  @override
  String toString() {
    return 'UserSummary(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserSummary &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_UserSummaryCopyWith<_$_UserSummary> get copyWith =>
      __$$_UserSummaryCopyWithImpl<_$_UserSummary>(this, _$identity);
}

abstract class _UserSummary implements UserSummary {
  const factory _UserSummary({required final UserId id}) = _$_UserSummary;

  @override
  UserId get id;
  @override
  @JsonKey(ignore: true)
  _$$_UserSummaryCopyWith<_$_UserSummary> get copyWith =>
      throw _privateConstructorUsedError;
}
