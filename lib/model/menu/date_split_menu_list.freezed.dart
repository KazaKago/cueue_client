// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_split_menu_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
      _$DateSplitMenuListCopyWithImpl<$Res, DateSplitMenuList>;
  @useResult
  $Res call({DateTime date, List<MenuSummary> menus});
}

/// @nodoc
class _$DateSplitMenuListCopyWithImpl<$Res, $Val extends DateSplitMenuList>
    implements $DateSplitMenuListCopyWith<$Res> {
  _$DateSplitMenuListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? menus = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menus: null == menus
          ? _value.menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuSummary>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateSplitMenuListImplCopyWith<$Res>
    implements $DateSplitMenuListCopyWith<$Res> {
  factory _$$DateSplitMenuListImplCopyWith(_$DateSplitMenuListImpl value,
          $Res Function(_$DateSplitMenuListImpl) then) =
      __$$DateSplitMenuListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<MenuSummary> menus});
}

/// @nodoc
class __$$DateSplitMenuListImplCopyWithImpl<$Res>
    extends _$DateSplitMenuListCopyWithImpl<$Res, _$DateSplitMenuListImpl>
    implements _$$DateSplitMenuListImplCopyWith<$Res> {
  __$$DateSplitMenuListImplCopyWithImpl(_$DateSplitMenuListImpl _value,
      $Res Function(_$DateSplitMenuListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? menus = null,
  }) {
    return _then(_$DateSplitMenuListImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menus: null == menus
          ? _value._menus
          : menus // ignore: cast_nullable_to_non_nullable
              as List<MenuSummary>,
    ));
  }
}

/// @nodoc

class _$DateSplitMenuListImpl implements _DateSplitMenuList {
  const _$DateSplitMenuListImpl(
      {required this.date, required final List<MenuSummary> menus})
      : _menus = menus;

  @override
  final DateTime date;
  final List<MenuSummary> _menus;
  @override
  List<MenuSummary> get menus {
    if (_menus is EqualUnmodifiableListView) return _menus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menus);
  }

  @override
  String toString() {
    return 'DateSplitMenuList(date: $date, menus: $menus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateSplitMenuListImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._menus, _menus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_menus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DateSplitMenuListImplCopyWith<_$DateSplitMenuListImpl> get copyWith =>
      __$$DateSplitMenuListImplCopyWithImpl<_$DateSplitMenuListImpl>(
          this, _$identity);
}

abstract class _DateSplitMenuList implements DateSplitMenuList {
  const factory _DateSplitMenuList(
      {required final DateTime date,
      required final List<MenuSummary> menus}) = _$DateSplitMenuListImpl;

  @override
  DateTime get date;
  @override
  List<MenuSummary> get menus;
  @override
  @JsonKey(ignore: true)
  _$$DateSplitMenuListImplCopyWith<_$DateSplitMenuListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
