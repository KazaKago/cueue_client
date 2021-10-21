// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'date_split_menu_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DateSplitMenuListTearOff {
  const _$DateSplitMenuListTearOff();

  _DateSplitMenuList call(
      {required DateTime date, required List<MenuSummary> menus}) {
    return _DateSplitMenuList(
      date: date,
      menus: menus,
    );
  }
}

/// @nodoc
const $DateSplitMenuList = _$DateSplitMenuListTearOff();

/// @nodoc
mixin _$DateSplitMenuList {
  DateTime get date => throw _privateConstructorUsedError;
  List<MenuSummary> get menus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateSplitMenuListCopyWith<DateSplitMenuList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateSplitMenuListCopyWith<$Res> {
  factory $DateSplitMenuListCopyWith(
          DateSplitMenuList value, $Res Function(DateSplitMenuList) then) =
      _$DateSplitMenuListCopyWithImpl<$Res>;
  $Res call({DateTime date, List<MenuSummary> menus});
}

/// @nodoc
class _$DateSplitMenuListCopyWithImpl<$Res>
    implements $DateSplitMenuListCopyWith<$Res> {
  _$DateSplitMenuListCopyWithImpl(this._value, this._then);

  final DateSplitMenuList _value;
  // ignore: unused_field
  final $Res Function(DateSplitMenuList) _then;

  @override
  $Res call({
    Object? date = freezed,
    Object? menus = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menus: menus == freezed
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuSummary>,
    ));
  }
}

/// @nodoc
abstract class _$DateSplitMenuListCopyWith<$Res>
    implements $DateSplitMenuListCopyWith<$Res> {
  factory _$DateSplitMenuListCopyWith(
          _DateSplitMenuList value, $Res Function(_DateSplitMenuList) then) =
      __$DateSplitMenuListCopyWithImpl<$Res>;
  @override
  $Res call({DateTime date, List<MenuSummary> menus});
}

/// @nodoc
class __$DateSplitMenuListCopyWithImpl<$Res>
    extends _$DateSplitMenuListCopyWithImpl<$Res>
    implements _$DateSplitMenuListCopyWith<$Res> {
  __$DateSplitMenuListCopyWithImpl(
      _DateSplitMenuList _value, $Res Function(_DateSplitMenuList) _then)
      : super(_value, (v) => _then(v as _DateSplitMenuList));

  @override
  _DateSplitMenuList get _value => super._value as _DateSplitMenuList;

  @override
  $Res call({
    Object? date = freezed,
    Object? menus = freezed,
  }) {
    return _then(_DateSplitMenuList(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menus: menus == freezed
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuSummary>,
    ));
  }
}

/// @nodoc

class _$_DateSplitMenuList implements _DateSplitMenuList {
  const _$_DateSplitMenuList({required this.date, required this.menus});

  @override
  final DateTime date;
  @override
  final List<MenuSummary> menus;

  @override
  String toString() {
    return 'DateSplitMenuList(date: $date, menus: $menus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DateSplitMenuList &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other.menus, menus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(menus));

  @JsonKey(ignore: true)
  @override
  _$DateSplitMenuListCopyWith<_DateSplitMenuList> get copyWith =>
      __$DateSplitMenuListCopyWithImpl<_DateSplitMenuList>(this, _$identity);
}

abstract class _DateSplitMenuList implements DateSplitMenuList {
  const factory _DateSplitMenuList(
      {required DateTime date,
      required List<MenuSummary> menus}) = _$_DateSplitMenuList;

  @override
  DateTime get date;
  @override
  List<MenuSummary> get menus;
  @override
  @JsonKey(ignore: true)
  _$DateSplitMenuListCopyWith<_DateSplitMenuList> get copyWith =>
      throw _privateConstructorUsedError;
}
