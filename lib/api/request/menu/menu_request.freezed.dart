// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$MenuRequestCopyWithImpl<$Res, MenuRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipe_ids') List<int> recipeIds});
}

/// @nodoc
class _$MenuRequestCopyWithImpl<$Res, $Val extends MenuRequest>
    implements $MenuRequestCopyWith<$Res> {
  _$MenuRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memo = null,
    Object? date = null,
    Object? timeFrame = null,
    Object? recipeIds = null,
  }) {
    return _then(_value.copyWith(
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as String,
      recipeIds: null == recipeIds
          ? _value.recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuRequestImplCopyWith<$Res>
    implements $MenuRequestCopyWith<$Res> {
  factory _$$MenuRequestImplCopyWith(
          _$MenuRequestImpl value, $Res Function(_$MenuRequestImpl) then) =
      __$$MenuRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipe_ids') List<int> recipeIds});
}

/// @nodoc
class __$$MenuRequestImplCopyWithImpl<$Res>
    extends _$MenuRequestCopyWithImpl<$Res, _$MenuRequestImpl>
    implements _$$MenuRequestImplCopyWith<$Res> {
  __$$MenuRequestImplCopyWithImpl(
      _$MenuRequestImpl _value, $Res Function(_$MenuRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memo = null,
    Object? date = null,
    Object? timeFrame = null,
    Object? recipeIds = null,
  }) {
    return _then(_$MenuRequestImpl(
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as String,
      recipeIds: null == recipeIds
          ? _value._recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuRequestImpl implements _MenuRequest {
  const _$MenuRequestImpl(
      {@JsonKey(name: 'memo') required this.memo,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'time_frame') required this.timeFrame,
      @JsonKey(name: 'recipe_ids') required final List<int> recipeIds})
      : _recipeIds = recipeIds;

  factory _$MenuRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuRequestImplFromJson(json);

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
    if (_recipeIds is EqualUnmodifiableListView) return _recipeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeIds);
  }

  @override
  String toString() {
    return 'MenuRequest(memo: $memo, date: $date, timeFrame: $timeFrame, recipeIds: $recipeIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRequestImpl &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeFrame, timeFrame) ||
                other.timeFrame == timeFrame) &&
            const DeepCollectionEquality()
                .equals(other._recipeIds, _recipeIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memo, date, timeFrame,
      const DeepCollectionEquality().hash(_recipeIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuRequestImplCopyWith<_$MenuRequestImpl> get copyWith =>
      __$$MenuRequestImplCopyWithImpl<_$MenuRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuRequestImplToJson(
      this,
    );
  }
}

abstract class _MenuRequest implements MenuRequest {
  const factory _MenuRequest(
          {@JsonKey(name: 'memo') required final String memo,
          @JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'time_frame') required final String timeFrame,
          @JsonKey(name: 'recipe_ids') required final List<int> recipeIds}) =
      _$MenuRequestImpl;

  factory _MenuRequest.fromJson(Map<String, dynamic> json) =
      _$MenuRequestImpl.fromJson;

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
  _$$MenuRequestImplCopyWith<_$MenuRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
