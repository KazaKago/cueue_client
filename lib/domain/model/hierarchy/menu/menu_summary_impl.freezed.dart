// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_summary_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MenuSummaryImplTearOff {
  const _$MenuSummaryImplTearOff();

  _MenuSummaryImpl call(
      {required MenuId id,
      required String memo,
      required DateTime date,
      required TimeFrame timeFrame,
      required List<RecipeSummary> recipes}) {
    return _MenuSummaryImpl(
      id: id,
      memo: memo,
      date: date,
      timeFrame: timeFrame,
      recipes: recipes,
    );
  }
}

/// @nodoc
const $MenuSummaryImpl = _$MenuSummaryImplTearOff();

/// @nodoc
mixin _$MenuSummaryImpl {
  MenuId get id => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeFrame get timeFrame => throw _privateConstructorUsedError;
  List<RecipeSummary> get recipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuSummaryImplCopyWith<MenuSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuSummaryImplCopyWith<$Res> {
  factory $MenuSummaryImplCopyWith(
          MenuSummaryImpl value, $Res Function(MenuSummaryImpl) then) =
      _$MenuSummaryImplCopyWithImpl<$Res>;
  $Res call(
      {MenuId id,
      String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeSummary> recipes});

  $MenuIdCopyWith<$Res> get id;
}

/// @nodoc
class _$MenuSummaryImplCopyWithImpl<$Res>
    implements $MenuSummaryImplCopyWith<$Res> {
  _$MenuSummaryImplCopyWithImpl(this._value, this._then);

  final MenuSummaryImpl _value;
  // ignore: unused_field
  final $Res Function(MenuSummaryImpl) _then;

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
              as MenuId,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeFrame: timeFrame == freezed
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as TimeFrame,
      recipes: recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ));
  }

  @override
  $MenuIdCopyWith<$Res> get id {
    return $MenuIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$MenuSummaryImplCopyWith<$Res>
    implements $MenuSummaryImplCopyWith<$Res> {
  factory _$MenuSummaryImplCopyWith(
          _MenuSummaryImpl value, $Res Function(_MenuSummaryImpl) then) =
      __$MenuSummaryImplCopyWithImpl<$Res>;
  @override
  $Res call(
      {MenuId id,
      String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeSummary> recipes});

  @override
  $MenuIdCopyWith<$Res> get id;
}

/// @nodoc
class __$MenuSummaryImplCopyWithImpl<$Res>
    extends _$MenuSummaryImplCopyWithImpl<$Res>
    implements _$MenuSummaryImplCopyWith<$Res> {
  __$MenuSummaryImplCopyWithImpl(
      _MenuSummaryImpl _value, $Res Function(_MenuSummaryImpl) _then)
      : super(_value, (v) => _then(v as _MenuSummaryImpl));

  @override
  _MenuSummaryImpl get _value => super._value as _MenuSummaryImpl;

  @override
  $Res call({
    Object? id = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_MenuSummaryImpl(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MenuId,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeFrame: timeFrame == freezed
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as TimeFrame,
      recipes: recipes == freezed
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ));
  }
}

/// @nodoc

class _$_MenuSummaryImpl implements _MenuSummaryImpl {
  const _$_MenuSummaryImpl(
      {required this.id,
      required this.memo,
      required this.date,
      required this.timeFrame,
      required this.recipes});

  @override
  final MenuId id;
  @override
  final String memo;
  @override
  final DateTime date;
  @override
  final TimeFrame timeFrame;
  @override
  final List<RecipeSummary> recipes;

  @override
  String toString() {
    return 'MenuSummaryImpl(id: $id, memo: $memo, date: $date, timeFrame: $timeFrame, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuSummaryImpl &&
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
  _$MenuSummaryImplCopyWith<_MenuSummaryImpl> get copyWith =>
      __$MenuSummaryImplCopyWithImpl<_MenuSummaryImpl>(this, _$identity);
}

abstract class _MenuSummaryImpl implements MenuSummaryImpl {
  const factory _MenuSummaryImpl(
      {required MenuId id,
      required String memo,
      required DateTime date,
      required TimeFrame timeFrame,
      required List<RecipeSummary> recipes}) = _$_MenuSummaryImpl;

  @override
  MenuId get id => throw _privateConstructorUsedError;
  @override
  String get memo => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  TimeFrame get timeFrame => throw _privateConstructorUsedError;
  @override
  List<RecipeSummary> get recipes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuSummaryImplCopyWith<_MenuSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
