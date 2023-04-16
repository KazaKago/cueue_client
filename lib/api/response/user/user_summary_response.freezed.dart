// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserSummaryResponse _$UserSummaryResponseFromJson(Map<String, dynamic> json) {
  return _UserSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$UserSummaryResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'photo')
  ContentResponse? get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserSummaryResponseCopyWith<UserSummaryResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSummaryResponseCopyWith<$Res> {
  factory $UserSummaryResponseCopyWith(UserSummaryResponse value, $Res Function(UserSummaryResponse) then) = _$UserSummaryResponseCopyWithImpl<$Res, UserSummaryResponse>;

  @useResult
  $Res call({@JsonKey(name: 'id') int id, @JsonKey(name: 'display_name') String displayName, @JsonKey(name: 'photo') ContentResponse? photo});

  $ContentResponseCopyWith<$Res>? get photo;
}

/// @nodoc
class _$UserSummaryResponseCopyWithImpl<$Res, $Val extends UserSummaryResponse> implements $UserSummaryResponseCopyWith<$Res> {
  _$UserSummaryResponseCopyWithImpl(this._value, this._then);

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
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContentResponseCopyWith<$Res>? get photo {
    if (_value.photo == null) {
      return null;
    }

    return $ContentResponseCopyWith<$Res>(_value.photo!, (value) {
      return _then(_value.copyWith(photo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserSummaryResponseCopyWith<$Res> implements $UserSummaryResponseCopyWith<$Res> {
  factory _$$_UserSummaryResponseCopyWith(_$_UserSummaryResponse value, $Res Function(_$_UserSummaryResponse) then) = __$$_UserSummaryResponseCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id, @JsonKey(name: 'display_name') String displayName, @JsonKey(name: 'photo') ContentResponse? photo});

  @override
  $ContentResponseCopyWith<$Res>? get photo;
}

/// @nodoc
class __$$_UserSummaryResponseCopyWithImpl<$Res> extends _$UserSummaryResponseCopyWithImpl<$Res, _$_UserSummaryResponse> implements _$$_UserSummaryResponseCopyWith<$Res> {
  __$$_UserSummaryResponseCopyWithImpl(_$_UserSummaryResponse _value, $Res Function(_$_UserSummaryResponse) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? photo = freezed,
  }) {
    return _then(_$_UserSummaryResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as ContentResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserSummaryResponse implements _UserSummaryResponse {
  const _$_UserSummaryResponse({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'display_name') required this.displayName, @JsonKey(name: 'photo') required this.photo});

  factory _$_UserSummaryResponse.fromJson(Map<String, dynamic> json) => _$$_UserSummaryResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'id')
  final int id;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'display_name')
  final String displayName;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'photo')
  final ContentResponse? photo;

  @override
  String toString() {
    return 'UserSummaryResponse(id: $id, displayName: $displayName, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_UserSummaryResponse && (identical(other.id, id) || other.id == id) && (identical(other.displayName, displayName) || other.displayName == displayName) && (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, displayName, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserSummaryResponseCopyWith<_$_UserSummaryResponse> get copyWith => __$$_UserSummaryResponseCopyWithImpl<_$_UserSummaryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserSummaryResponseToJson(
      this,
    );
  }
}

abstract class _UserSummaryResponse implements UserSummaryResponse {
  const factory _UserSummaryResponse({@JsonKey(name: 'id') required final int id, @JsonKey(name: 'display_name') required final String displayName, @JsonKey(name: 'photo') required final ContentResponse? photo}) = _$_UserSummaryResponse;

  factory _UserSummaryResponse.fromJson(Map<String, dynamic> json) = _$_UserSummaryResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'display_name')
  String get displayName;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'photo')
  ContentResponse? get photo;

  @override
  @JsonKey(ignore: true)
  _$$_UserSummaryResponseCopyWith<_$_UserSummaryResponse> get copyWith => throw _privateConstructorUsedError;
}