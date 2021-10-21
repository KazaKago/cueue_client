// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_summary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuSummaryResponse _$MenuSummaryResponseFromJson(Map<String, dynamic> json) {
  return _MenuSummaryResponse.fromJson(json);
}

/// @nodoc
class _$MenuSummaryResponseTearOff {
  const _$MenuSummaryResponseTearOff();

  _MenuSummaryResponse call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'memo') required String memo,
      @JsonKey(name: 'date') required String date,
      @JsonKey(name: 'time_frame') required String timeFrame,
      @JsonKey(name: 'recipes') required List<RecipeSummaryResponse> recipes}) {
    return _MenuSummaryResponse(
      id: id,
      memo: memo,
      date: date,
      timeFrame: timeFrame,
      recipes: recipes,
    );
  }

  MenuSummaryResponse fromJson(Map<String, Object?> json) {
    return MenuSummaryResponse.fromJson(json);
  }
}

/// @nodoc
const $MenuSummaryResponse = _$MenuSummaryResponseTearOff();

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
      _$MenuSummaryResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipes') List<RecipeSummaryResponse> recipes});
}

/// @nodoc
class _$MenuSummaryResponseCopyWithImpl<$Res>
    implements $MenuSummaryResponseCopyWith<$Res> {
  _$MenuSummaryResponseCopyWithImpl(this._value, this._then);

  final MenuSummaryResponse _value;
  // ignore: unused_field
  final $Res Function(MenuSummaryResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      recipes: recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummaryResponse>,
    ));
  }
}

/// @nodoc
abstract class _$MenuSummaryResponseCopyWith<$Res>
    implements $MenuSummaryResponseCopyWith<$Res> {
  factory _$MenuSummaryResponseCopyWith(_MenuSummaryResponse value,
          $Res Function(_MenuSummaryResponse) then) =
      __$MenuSummaryResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipes') List<RecipeSummaryResponse> recipes});
}

/// @nodoc
class __$MenuSummaryResponseCopyWithImpl<$Res>
    extends _$MenuSummaryResponseCopyWithImpl<$Res>
    implements _$MenuSummaryResponseCopyWith<$Res> {
  __$MenuSummaryResponseCopyWithImpl(
      _MenuSummaryResponse _value, $Res Function(_MenuSummaryResponse) _then)
      : super(_value, (v) => _then(v as _MenuSummaryResponse));

  @override
  _MenuSummaryResponse get _value => super._value as _MenuSummaryResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_MenuSummaryResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      recipes: recipes == freezed
          ? _value.recipes
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
      @JsonKey(name: 'recipes') required this.recipes});

  factory _$_MenuSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MenuSummaryResponseFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  final int id;
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
  @JsonKey(name: 'recipes')
  final List<RecipeSummaryResponse> recipes;

  @override
  String toString() {
    return 'MenuSummaryResponse(id: $id, memo: $memo, date: $date, timeFrame: $timeFrame, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MenuSummaryResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeFrame, timeFrame) ||
                other.timeFrame == timeFrame) &&
            const DeepCollectionEquality().equals(other.recipes, recipes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, memo, date, timeFrame,
      const DeepCollectionEquality().hash(recipes));

  @JsonKey(ignore: true)
  @override
  _$MenuSummaryResponseCopyWith<_MenuSummaryResponse> get copyWith =>
      __$MenuSummaryResponseCopyWithImpl<_MenuSummaryResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuSummaryResponseToJson(this);
  }
}

abstract class _MenuSummaryResponse implements MenuSummaryResponse {
  const factory _MenuSummaryResponse(
          {@JsonKey(name: 'id')
              required int id,
          @JsonKey(name: 'memo')
              required String memo,
          @JsonKey(name: 'date')
              required String date,
          @JsonKey(name: 'time_frame')
              required String timeFrame,
          @JsonKey(name: 'recipes')
              required List<RecipeSummaryResponse> recipes}) =
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
  _$MenuSummaryResponseCopyWith<_MenuSummaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
