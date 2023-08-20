// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuSummaryResponse _$MenuSummaryResponseFromJson(Map<String, dynamic> json) {
  return _MenuSummaryResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuSummaryResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'memo')
  String get memo =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'date')
  String get date =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'time_frame')
  String get timeFrame =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'recipes')
  List<RecipeSummaryResponse> get recipes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuSummaryResponseCopyWith<MenuSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuSummaryResponseCopyWith<$Res> {
  factory $MenuSummaryResponseCopyWith(
          MenuSummaryResponse value, $Res Function(MenuSummaryResponse) then) =
      _$MenuSummaryResponseCopyWithImpl<$Res, MenuSummaryResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipes') List<RecipeSummaryResponse> recipes});
}

/// @nodoc
class _$MenuSummaryResponseCopyWithImpl<$Res, $Val extends MenuSummaryResponse>
    implements $MenuSummaryResponseCopyWith<$Res> {
  _$MenuSummaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memo = null,
    Object? date = null,
    Object? timeFrame = null,
    Object? recipes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummaryResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuSummaryResponseCopyWith<$Res>
    implements $MenuSummaryResponseCopyWith<$Res> {
  factory _$$_MenuSummaryResponseCopyWith(_$_MenuSummaryResponse value,
          $Res Function(_$_MenuSummaryResponse) then) =
      __$$_MenuSummaryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipes') List<RecipeSummaryResponse> recipes});
}

/// @nodoc
class __$$_MenuSummaryResponseCopyWithImpl<$Res>
    extends _$MenuSummaryResponseCopyWithImpl<$Res, _$_MenuSummaryResponse>
    implements _$$_MenuSummaryResponseCopyWith<$Res> {
  __$$_MenuSummaryResponseCopyWithImpl(_$_MenuSummaryResponse _value,
      $Res Function(_$_MenuSummaryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? memo = null,
    Object? date = null,
    Object? timeFrame = null,
    Object? recipes = null,
  }) {
    return _then(_$_MenuSummaryResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummaryResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuSummaryResponse implements _MenuSummaryResponse {
  const _$_MenuSummaryResponse(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'memo') required this.memo,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'time_frame') required this.timeFrame,
      @JsonKey(name: 'recipes')
      required final List<RecipeSummaryResponse> recipes})
      : _recipes = recipes;

  factory _$_MenuSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MenuSummaryResponseFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'id')
  final int id;
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
  final List<RecipeSummaryResponse> _recipes;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'recipes')
  List<RecipeSummaryResponse> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'MenuSummaryResponse(id: $id, memo: $memo, date: $date, timeFrame: $timeFrame, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuSummaryResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeFrame, timeFrame) ||
                other.timeFrame == timeFrame) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, memo, date, timeFrame,
      const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuSummaryResponseCopyWith<_$_MenuSummaryResponse> get copyWith =>
      __$$_MenuSummaryResponseCopyWithImpl<_$_MenuSummaryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuSummaryResponseToJson(
      this,
    );
  }
}

abstract class _MenuSummaryResponse implements MenuSummaryResponse {
  const factory _MenuSummaryResponse(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'memo') required final String memo,
          @JsonKey(name: 'date') required final String date,
          @JsonKey(name: 'time_frame') required final String timeFrame,
          @JsonKey(name: 'recipes')
          required final List<RecipeSummaryResponse> recipes}) =
      _$_MenuSummaryResponse;

  factory _MenuSummaryResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuSummaryResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
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
  @JsonKey(name: 'recipes')
  List<RecipeSummaryResponse> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$_MenuSummaryResponseCopyWith<_$_MenuSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
