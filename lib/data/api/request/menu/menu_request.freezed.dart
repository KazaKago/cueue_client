// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuRequest _$MenuRequestFromJson(Map<String, dynamic> json) {
  return _MenuRequest.fromJson(json);
}

/// @nodoc
mixin _$MenuRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'memo')
  String get memo =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'date')
  String get date =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'time_frame')
  String get timeFrame =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'recipe_ids')
  List<int> get recipeIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuRequestCopyWith<MenuRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuRequestCopyWith<$Res> {
  factory $MenuRequestCopyWith(
          MenuRequest value, $Res Function(MenuRequest) then) =
      _$MenuRequestCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipe_ids') List<int> recipeIds});
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
abstract class _$$_MenuRequestCopyWith<$Res>
    implements $MenuRequestCopyWith<$Res> {
  factory _$$_MenuRequestCopyWith(
          _$_MenuRequest value, $Res Function(_$_MenuRequest) then) =
      __$$_MenuRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipe_ids') List<int> recipeIds});
}

/// @nodoc
class __$$_MenuRequestCopyWithImpl<$Res> extends _$MenuRequestCopyWithImpl<$Res>
    implements _$$_MenuRequestCopyWith<$Res> {
  __$$_MenuRequestCopyWithImpl(
      _$_MenuRequest _value, $Res Function(_$_MenuRequest) _then)
      : super(_value, (v) => _then(v as _$_MenuRequest));

  @override
  _$_MenuRequest get _value => super._value as _$_MenuRequest;

  @override
  $Res call({
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipeIds = freezed,
  }) {
    return _then(_$_MenuRequest(
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
          ? _value._recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuRequest implements _MenuRequest {
  const _$_MenuRequest(
      {@JsonKey(name: 'memo') required this.memo,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'time_frame') required this.timeFrame,
      @JsonKey(name: 'recipe_ids') required final List<int> recipeIds})
      : _recipeIds = recipeIds;

  factory _$_MenuRequest.fromJson(Map<String, dynamic> json) =>
      _$$_MenuRequestFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'memo')
  final String memo;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'date')
  final String date;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'time_frame')
  final String timeFrame;
// ignore: invalid_annotation_target
  final List<int> _recipeIds;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'recipe_ids')
  List<int> get recipeIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeIds);
  }

  @override
  String toString() {
    return 'MenuRequest(memo: $memo, date: $date, timeFrame: $timeFrame, recipeIds: $recipeIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuRequest &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.timeFrame, timeFrame) &&
            const DeepCollectionEquality()
                .equals(other._recipeIds, _recipeIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(timeFrame),
      const DeepCollectionEquality().hash(_recipeIds));

  @JsonKey(ignore: true)
  @override
  _$$_MenuRequestCopyWith<_$_MenuRequest> get copyWith =>
      __$$_MenuRequestCopyWithImpl<_$_MenuRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuRequestToJson(this);
  }
}

abstract class _MenuRequest implements MenuRequest {
  const factory _MenuRequest(
          {@JsonKey(name: 'memo') required final String memo,
          @JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'time_frame') required final String timeFrame,
          @JsonKey(name: 'recipe_ids') required final List<int> recipeIds}) =
      _$_MenuRequest;

  factory _MenuRequest.fromJson(Map<String, dynamic> json) =
      _$_MenuRequest.fromJson;

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
  _$$_MenuRequestCopyWith<_$_MenuRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
