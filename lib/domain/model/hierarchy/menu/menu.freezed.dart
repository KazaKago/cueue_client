// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Menu {
  MenuId get id => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeFrame get timeFrame => throw _privateConstructorUsedError;
  List<RecipeSummary> get recipes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuCopyWith<Menu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuCopyWith<$Res> {
  factory $MenuCopyWith(Menu value, $Res Function(Menu) then) =
      _$MenuCopyWithImpl<$Res>;
  $Res call(
      {MenuId id,
      String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeSummary> recipes});

  $MenuIdCopyWith<$Res> get id;
}

/// @nodoc
class _$MenuCopyWithImpl<$Res> implements $MenuCopyWith<$Res> {
  _$MenuCopyWithImpl(this._value, this._then);

  final Menu _value;
  // ignore: unused_field
  final $Res Function(Menu) _then;

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
abstract class _$MenuCopyWith<$Res> implements $MenuCopyWith<$Res> {
  factory _$MenuCopyWith(_Menu value, $Res Function(_Menu) then) =
      __$MenuCopyWithImpl<$Res>;
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
class __$MenuCopyWithImpl<$Res> extends _$MenuCopyWithImpl<$Res>
    implements _$MenuCopyWith<$Res> {
  __$MenuCopyWithImpl(_Menu _value, $Res Function(_Menu) _then)
      : super(_value, (v) => _then(v as _Menu));

  @override
  _Menu get _value => super._value as _Menu;

  @override
  $Res call({
    Object? id = freezed,
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipes = freezed,
  }) {
    return _then(_Menu(
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

class _$_Menu implements _Menu {
  const _$_Menu(
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
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipes);
  }

  @override
  String toString() {
    return 'Menu(id: $id, memo: $memo, date: $date, timeFrame: $timeFrame, recipes: $recipes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Menu &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.timeFrame, timeFrame) &&
            const DeepCollectionEquality().equals(other.recipes, recipes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(timeFrame),
      const DeepCollectionEquality().hash(recipes));

  @JsonKey(ignore: true)
  @override
  _$MenuCopyWith<_Menu> get copyWith =>
      __$MenuCopyWithImpl<_Menu>(this, _$identity);
}

abstract class _Menu implements Menu {
  const factory _Menu(
      {required final MenuId id,
      required final String memo,
      required final DateTime date,
      required final TimeFrame timeFrame,
      required final List<RecipeSummary> recipes}) = _$_Menu;

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
  _$MenuCopyWith<_Menu> get copyWith => throw _privateConstructorUsedError;
}
