// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuRequest _$MenuRequestFromJson(Map<String, dynamic> json) {
  return _MenuRequest.fromJson(json);
}

/// @nodoc
class _$MenuRequestTearOff {
  const _$MenuRequestTearOff();

  _MenuRequest call({@JsonKey(name: 'memo') required String memo, @JsonKey(name: 'date') required String date, @JsonKey(name: 'time_frame') required String timeFrame, @JsonKey(name: 'recipe_ids') required List<int> recipeIds}) {
    return _MenuRequest(
      memo: memo,
      date: date,
      timeFrame: timeFrame,
      recipeIds: recipeIds,
    );
  }

  MenuRequest fromJson(Map<String, Object?> json) {
    return MenuRequest.fromJson(json);
  }
}

/// @nodoc
const $MenuRequest = _$MenuRequestTearOff();

/// @nodoc
mixin _$MenuRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'memo')
  String get memo => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'time_frame')
  String get timeFrame => throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'recipe_ids')
  List<int> get recipeIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuRequestCopyWith<MenuRequest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuRequestCopyWith<$Res> {
  factory $MenuRequestCopyWith(MenuRequest value, $Res Function(MenuRequest) then) = _$MenuRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'memo') String memo, @JsonKey(name: 'date') String date, @JsonKey(name: 'time_frame') String timeFrame, @JsonKey(name: 'recipe_ids') List<int> recipeIds});
}

/// @nodoc
class _$MenuRequestCopyWithImpl<$Res> implements $MenuRequestCopyWith<$Res> {
  _$MenuRequestCopyWithImpl(this._value, this._then);

  final MenuRequest _value;
  // ignore: unused_field
  final $Res Function(MenuRequest) _then;

  @override
  $Res call({
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipeIds = freezed,
  }) {
    return _then(_value.copyWith(
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeFrame: timeFrame == freezed
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as String,
      recipeIds: recipeIds == freezed
          ? _value.recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
abstract class _$MenuRequestCopyWith<$Res> implements $MenuRequestCopyWith<$Res> {
  factory _$MenuRequestCopyWith(_MenuRequest value, $Res Function(_MenuRequest) then) = __$MenuRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'memo') String memo, @JsonKey(name: 'date') String date, @JsonKey(name: 'time_frame') String timeFrame, @JsonKey(name: 'recipe_ids') List<int> recipeIds});
}

/// @nodoc
class __$MenuRequestCopyWithImpl<$Res> extends _$MenuRequestCopyWithImpl<$Res> implements _$MenuRequestCopyWith<$Res> {
  __$MenuRequestCopyWithImpl(_MenuRequest _value, $Res Function(_MenuRequest) _then) : super(_value, (v) => _then(v as _MenuRequest));

  @override
  _MenuRequest get _value => super._value as _MenuRequest;

  @override
  $Res call({
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipeIds = freezed,
  }) {
    return _then(_MenuRequest(
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeFrame: timeFrame == freezed
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as String,
      recipeIds: recipeIds == freezed
          ? _value.recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuRequest implements _MenuRequest {
  const _$_MenuRequest({@JsonKey(name: 'memo') required this.memo, @JsonKey(name: 'date') required this.date, @JsonKey(name: 'time_frame') required this.timeFrame, @JsonKey(name: 'recipe_ids') required this.recipeIds});

  factory _$_MenuRequest.fromJson(Map<String, dynamic> json) => _$$_MenuRequestFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'memo')
  final String memo;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'date')
  final String date;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'time_frame')
  final String timeFrame;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'recipe_ids')
  final List<int> recipeIds;

  @override
  String toString() {
    return 'MenuRequest(memo: $memo, date: $date, timeFrame: $timeFrame, recipeIds: $recipeIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _MenuRequest && const DeepCollectionEquality().equals(other.memo, memo) && const DeepCollectionEquality().equals(other.date, date) && const DeepCollectionEquality().equals(other.timeFrame, timeFrame) && const DeepCollectionEquality().equals(other.recipeIds, recipeIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(memo), const DeepCollectionEquality().hash(date), const DeepCollectionEquality().hash(timeFrame), const DeepCollectionEquality().hash(recipeIds));

  @JsonKey(ignore: true)
  @override
  _$MenuRequestCopyWith<_MenuRequest> get copyWith => __$MenuRequestCopyWithImpl<_MenuRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuRequestToJson(this);
  }
}

abstract class _MenuRequest implements MenuRequest {
  const factory _MenuRequest({@JsonKey(name: 'memo') required String memo, @JsonKey(name: 'date') required String date, @JsonKey(name: 'time_frame') required String timeFrame, @JsonKey(name: 'recipe_ids') required List<int> recipeIds}) = _$_MenuRequest;

  factory _MenuRequest.fromJson(Map<String, dynamic> json) = _$_MenuRequest.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'memo')
  String get memo;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'date')
  String get date;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'time_frame')
  String get timeFrame;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'recipe_ids')
  List<int> get recipeIds;
  @override
  @JsonKey(ignore: true)
  _$MenuRequestCopyWith<_MenuRequest> get copyWith => throw _privateConstructorUsedError;
}
