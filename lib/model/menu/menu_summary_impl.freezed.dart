// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_summary_impl.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$MenuSummaryImplCopyWithImpl<$Res, MenuSummaryImpl>;
  @useResult
  $Res call(
      {MenuId id,
      String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeSummary> recipes});

  $MenuIdCopyWith<$Res> get id;
}

/// @nodoc
class _$MenuSummaryImplCopyWithImpl<$Res, $Val extends MenuSummaryImpl>
    implements $MenuSummaryImplCopyWith<$Res> {
  _$MenuSummaryImplCopyWithImpl(this._value, this._then);

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
              as MenuId,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as TimeFrame,
      recipes: null == recipes
          ? _value.recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MenuIdCopyWith<$Res> get id {
    return $MenuIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MenuSummaryImplImplCopyWith<$Res>
    implements $MenuSummaryImplCopyWith<$Res> {
  factory _$$MenuSummaryImplImplCopyWith(_$MenuSummaryImplImpl value,
          $Res Function(_$MenuSummaryImplImpl) then) =
      __$$MenuSummaryImplImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$MenuSummaryImplImplCopyWithImpl<$Res>
    extends _$MenuSummaryImplCopyWithImpl<$Res, _$MenuSummaryImplImpl>
    implements _$$MenuSummaryImplImplCopyWith<$Res> {
  __$$MenuSummaryImplImplCopyWithImpl(
      _$MenuSummaryImplImpl _value, $Res Function(_$MenuSummaryImplImpl) _then)
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
    return _then(_$MenuSummaryImplImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as MenuId,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeFrame: null == timeFrame
          ? _value.timeFrame
          : timeFrame // ignore: cast_nullable_to_non_nullable
              as TimeFrame,
      recipes: null == recipes
          ? _value._recipes
          : recipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeSummary>,
    ));
  }
}

/// @nodoc

class _$MenuSummaryImplImpl implements _MenuSummaryImpl {
  const _$MenuSummaryImplImpl(
      {required this.id,
      required this.memo,
      required this.date,
      required this.timeFrame,
      required final List<RecipeSummary> recipes})
      : _recipes = recipes;

  @override
  final MenuId id;
  @override
  final String memo;
  @override
  final DateTime date;
  @override
  final TimeFrame timeFrame;
  final List<RecipeSummary> _recipes;
  @override
  List<RecipeSummary> get recipes {
    if (_recipes is EqualUnmodifiableListView) return _recipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'MenuSummaryImpl(id: $id, memo: $memo, date: $date, timeFrame: $timeFrame, recipes: $recipes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuSummaryImplImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeFrame, timeFrame) ||
                other.timeFrame == timeFrame) &&
            const DeepCollectionEquality().equals(other._recipes, _recipes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, memo, date, timeFrame,
      const DeepCollectionEquality().hash(_recipes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuSummaryImplImplCopyWith<_$MenuSummaryImplImpl> get copyWith =>
      __$$MenuSummaryImplImplCopyWithImpl<_$MenuSummaryImplImpl>(
          this, _$identity);
}

abstract class _MenuSummaryImpl implements MenuSummaryImpl {
  const factory _MenuSummaryImpl(
      {required final MenuId id,
      required final String memo,
      required final DateTime date,
      required final TimeFrame timeFrame,
      required final List<RecipeSummary> recipes}) = _$MenuSummaryImplImpl;

  @override
  MenuId get id;
  @override
  String get memo;
  @override
  DateTime get date;
  @override
  TimeFrame get timeFrame;
  @override
  List<RecipeSummary> get recipes;
  @override
  @JsonKey(ignore: true)
  _$$MenuSummaryImplImplCopyWith<_$MenuSummaryImplImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
