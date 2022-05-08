// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MenuResponse _$MenuResponseFromJson(Map<String, dynamic> json) {
  return _MenuResponse.fromJson(json);
}

/// @nodoc
mixin _$MenuResponse {
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
abstract class _$$_MenuResponseCopyWith<$Res>
    implements $MenuResponseCopyWith<$Res> {
  factory _$$_MenuResponseCopyWith(
          _$_MenuResponse value, $Res Function(_$_MenuResponse) then) =
      __$$_MenuResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'memo') String memo,
      @JsonKey(name: 'date') String date,
      @JsonKey(name: 'time_frame') String timeFrame,
      @JsonKey(name: 'recipes') List<RecipeSummaryResponse> recipes});
}

/// @nodoc
class __$$_MenuResponseCopyWithImpl<$Res>
    extends _$MenuResponseCopyWithImpl<$Res>
    implements _$$_MenuResponseCopyWith<$Res> {
  __$$_MenuResponseCopyWithImpl(
      _$_MenuResponse _value, $Res Function(_$_MenuResponse) _then)
      : super(_value, (v) => _then(v as _$_MenuResponse));

  @override
  _$_MenuResponse get _value => super._value as _$_MenuResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_$_MenuResponse(
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
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummaryResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MenuResponse implements _MenuResponse {
  const _$_MenuResponse(
      {@JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'memo')
          required this.memo,
      @JsonKey(name: 'date')
          required this.date,
      @JsonKey(name: 'time_frame')
          required this.timeFrame,
      @JsonKey(name: 'recipes')
          required final List<RecipeSummaryResponse> recipes})
      : _recipes = recipes;

  factory _$_MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MenuResponseFromJson(json);

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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'MenuResponse(id: $id, memo: $memo, date: $date, timeFrame: $timeFrame, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.timeFrame, timeFrame) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(timeFrame),
      const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  _$$_MenuResponseCopyWith<_$_MenuResponse> get copyWith =>
      __$$_MenuResponseCopyWithImpl<_$_MenuResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MenuResponseToJson(this);
  }
}

abstract class _MenuResponse implements MenuResponse {
  const factory _MenuResponse(
          {@JsonKey(name: 'id')
              required final int id,
          @JsonKey(name: 'memo')
              required final String memo,
          @JsonKey(name: 'date')
              required final String date,
          @JsonKey(name: 'time_frame')
              required final String timeFrame,
          @JsonKey(name: 'recipes')
              required final List<RecipeSummaryResponse> recipes}) =
      _$_MenuResponse;

  factory _MenuResponse.fromJson(Map<String, dynamic> json) =
      _$_MenuResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'memo')
  String get memo => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'time_frame')
  String get timeFrame => throw _privateConstructorUsedError;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'recipes')
  List<RecipeSummaryResponse> get recipes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MenuResponseCopyWith<_$_MenuResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
