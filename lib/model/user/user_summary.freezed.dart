// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserSummary {
  UserId get id => throw _privateConstructorUsedError;

  String get displayName => throw _privateConstructorUsedError;

  Content? get photo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSummaryCopyWith<UserSummary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSummaryCopyWith<$Res> {
  factory $UserSummaryCopyWith(UserSummary value, $Res Function(UserSummary) then) = _$UserSummaryCopyWithImpl<$Res, UserSummary>;

  @useResult
  $Res call({UserId id, String displayName, Content? photo});

  $UserIdCopyWith<$Res> get id;

  $ContentCopyWith<$Res>? get photo;
}

/// @nodoc
class _$UserSummaryCopyWithImpl<$Res, $Val extends UserSummary> implements $UserSummaryCopyWith<$Res> {
  _$UserSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? photo = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Content?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserIdCopyWith<$Res> get id {
    return $UserIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserSummaryCopyWith<$Res> implements $UserSummaryCopyWith<$Res> {
  factory _$$_UserSummaryCopyWith(_$_UserSummary value, $Res Function(_$_UserSummary) then) = __$$_UserSummaryCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({UserId id, String displayName, Content? photo});

  @override
  $UserIdCopyWith<$Res> get id;

  @override
  $ContentCopyWith<$Res>? get photo;
}

/// @nodoc
class __$$_UserSummaryCopyWithImpl<$Res> extends _$UserSummaryCopyWithImpl<$Res, _$_UserSummary> implements _$$_UserSummaryCopyWith<$Res> {
  __$$_UserSummaryCopyWithImpl(_$_UserSummary _value, $Res Function(_$_UserSummary) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? photo = freezed,
  }) {
    return _then(_$_UserSummary(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UserId,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Content?,
    ));
  }
}

/// @nodoc

class _$_UserSummary implements _UserSummary {
  const _$_UserSummary({required this.id, required this.displayName, required this.photo});

  @override
  final UserId id;
  @override
  final String displayName;
  @override
  final Content? photo;

  @override
  String toString() {
    return 'UserSummary(id: $id, displayName: $displayName, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_UserSummary && (identical(other.id, id) || other.id == id) && (identical(other.displayName, displayName) || other.displayName == displayName) && (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSummaryCopyWith<_$_UserSummary> get copyWith => __$$_UserSummaryCopyWithImpl<_$_UserSummary>(this, _$identity);
}

abstract class _UserSummary implements UserSummary {
  const factory _UserSummary({required final UserId id, required final String displayName, required final Content? photo}) = _$_UserSummary;

  @override
  UserId get id;

  @override
  String get displayName;

  @override
  Content? get photo;

  @override
  @JsonKey(ignore: true)
  _$$_UserSummaryCopyWith<_$_UserSummary> get copyWith => throw _privateConstructorUsedError;
}
