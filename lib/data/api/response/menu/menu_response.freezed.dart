// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
class _$MenuResponseTearOff {
  const _$MenuResponseTearOff();

  _MenuResponse call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'memo') required String memo,
      @JsonKey(name: 'date') required String date,
      @JsonKey(name: 'time_frame') required String timeFrame,
      @JsonKey(name: 'recipes') required List<RecipeSummaryResponse> recipes}) {
    return _MenuResponse(
      id: id,
      memo: memo,
      date: date,
      timeFrame: timeFrame,
      recipes: recipes,
    );
  }

  MenuResponse fromJson(Map<String, Object> json) {
    return MenuResponse.fromJson(json);
  }
}

/// @nodoc
const $MenuResponse = _$MenuResponseTearOff();

/// @nodoc
mixin _$MenuResponse {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'memo')
  String get memo => throw _privateConstructorUsedError;
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_frame')
  String get timeFrame => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipes')
  List<RecipeSummaryResponse> get recipes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MenuResponseCopyWith<MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuResponseCopyWith<$Res> {
  factory $MenuResponseCopyWith(
          MenuResponse value, $Res Function(MenuResponse) then) =
      _$MenuResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipes') List<RecipeSummaryResponse> recipes});
}

/// @nodoc
class _$MenuResponseCopyWithImpl<$Res> implements $MenuResponseCopyWith<$Res> {
  _$MenuResponseCopyWithImpl(this._value, this._then);

  final MenuResponse _value;
  // ignore: unused_field
  final $Res Function(MenuResponse) _then;

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
abstract class _$MenuResponseCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$MenuResponseCopyWith(
          _MenuResponse value, $Res Function(_MenuResponse) then) =
      __$MenuResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipes') List<RecipeSummaryResponse> recipes});
}

/// @nodoc
class __$MenuResponseCopyWithImpl<$Res> extends _$MenuResponseCopyWithImpl<$Res>
    implements _$MenuResponseCopyWith<$Res> {
  __$MenuResponseCopyWithImpl(
      _MenuResponse _value, $Res Function(_MenuResponse) _then)
      : super(_value, (v) => _then(v as _MenuResponse));

  @override
  _MenuResponse get _value => super._value as _MenuResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_MenuResponse(
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
class _$_MenuResponse implements _MenuResponse {
  const _$_MenuResponse(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'memo') required this.memo,
      @JsonKey(name: 'date') required this.date,
      @JsonKey(name: 'time_frame') required this.timeFrame,
      @JsonKey(name: 'recipes') required this.recipes});

  factory _$_MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MenuResponseFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'memo')
  final String memo;
  @override
  @JsonKey(name: 'date')
  final String date;
  @override
  @JsonKey(name: 'time_frame')
  final String timeFrame;
  @override
  @JsonKey(name: 'recipes')
  final List<RecipeSummaryResponse> recipes;

  @override
  String toString() {
    return 'MenuResponse(id: $id, memo: $memo, date: $date, timeFrame: $timeFrame, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.timeFrame, timeFrame) ||
                const DeepCollectionEquality()
                    .equals(other.timeFrame, timeFrame)) &&
            (identical(other.recipes, recipes) ||
                const DeepCollectionEquality().equals(other.recipes, recipes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(timeFrame) ^
      const DeepCollectionEquality().hash(recipes);

  @JsonKey(ignore: true)
  @override
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      __$MenuResponseCopyWithImpl<_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MenuResponseToJson(this);
  }
}

abstract class _MenuResponse implements MenuResponse {
  const factory _MenuResponse(
      {@JsonKey(name: 'id')
          required int id,
      @JsonKey(name: 'memo')
          required String memo,
      @JsonKey(name: 'date')
          required String date,
      @JsonKey(name: 'time_frame')
          required String timeFrame,
      @JsonKey(name: 'recipes')
          required List<RecipeSummaryResponse> recipes}) = _$_MenuResponse;

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuResponse.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'memo')
  String get memo => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'time_frame')
  String get timeFrame => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'recipes')
  List<RecipeSummaryResponse> get recipes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuResponseCopyWith<_MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
