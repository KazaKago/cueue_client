// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checkbox_menu_dialog_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckedMenuDialogEvent {
  List<CheckedMenuItem> get menuItems => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckedMenuItem> menuItems) positive,
    required TResult Function(List<CheckedMenuItem> menuItems) negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckedMenuItem> menuItems)? positive,
    TResult Function(List<CheckedMenuItem> menuItems)? negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckedMenuItem> menuItems)? positive,
    TResult Function(List<CheckedMenuItem> menuItems)? negative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Positive value) positive,
    required TResult Function(_Negative value) negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Negative value)? negative,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Negative value)? negative,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckedMenuDialogEventCopyWith<CheckedMenuDialogEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckedMenuDialogEventCopyWith<$Res> {
  factory $CheckedMenuDialogEventCopyWith(CheckedMenuDialogEvent value,
          $Res Function(CheckedMenuDialogEvent) then) =
      _$CheckedMenuDialogEventCopyWithImpl<$Res>;
  $Res call({List<CheckedMenuItem> menuItems});
}

/// @nodoc
class _$CheckedMenuDialogEventCopyWithImpl<$Res>
    implements $CheckedMenuDialogEventCopyWith<$Res> {
  _$CheckedMenuDialogEventCopyWithImpl(this._value, this._then);

  final CheckedMenuDialogEvent _value;
  // ignore: unused_field
  final $Res Function(CheckedMenuDialogEvent) _then;

  @override
  $Res call({
    Object? menuItems = freezed,
  }) {
    return _then(_value.copyWith(
      menuItems: menuItems == freezed
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<CheckedMenuItem>,
    ));
  }
}

/// @nodoc
abstract class _$$_PositiveCopyWith<$Res>
    implements $CheckedMenuDialogEventCopyWith<$Res> {
  factory _$$_PositiveCopyWith(
          _$_Positive value, $Res Function(_$_Positive) then) =
      __$$_PositiveCopyWithImpl<$Res>;
  @override
  $Res call({List<CheckedMenuItem> menuItems});
}

/// @nodoc
class __$$_PositiveCopyWithImpl<$Res>
    extends _$CheckedMenuDialogEventCopyWithImpl<$Res>
    implements _$$_PositiveCopyWith<$Res> {
  __$$_PositiveCopyWithImpl(
      _$_Positive _value, $Res Function(_$_Positive) _then)
      : super(_value, (v) => _then(v as _$_Positive));

  @override
  _$_Positive get _value => super._value as _$_Positive;

  @override
  $Res call({
    Object? menuItems = freezed,
  }) {
    return _then(_$_Positive(
      menuItems == freezed
          ? _value._menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<CheckedMenuItem>,
    ));
  }
}

/// @nodoc

class _$_Positive implements _Positive {
  const _$_Positive(final List<CheckedMenuItem> menuItems)
      : _menuItems = menuItems;

  final List<CheckedMenuItem> _menuItems;
  @override
  List<CheckedMenuItem> get menuItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuItems);
  }

  @override
  String toString() {
    return 'CheckedMenuDialogEvent.positive(menuItems: $menuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Positive &&
            const DeepCollectionEquality()
                .equals(other._menuItems, _menuItems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_menuItems));

  @JsonKey(ignore: true)
  @override
  _$$_PositiveCopyWith<_$_Positive> get copyWith =>
      __$$_PositiveCopyWithImpl<_$_Positive>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckedMenuItem> menuItems) positive,
    required TResult Function(List<CheckedMenuItem> menuItems) negative,
  }) {
    return positive(menuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckedMenuItem> menuItems)? positive,
    TResult Function(List<CheckedMenuItem> menuItems)? negative,
  }) {
    return positive?.call(menuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckedMenuItem> menuItems)? positive,
    TResult Function(List<CheckedMenuItem> menuItems)? negative,
    required TResult orElse(),
  }) {
    if (positive != null) {
      return positive(menuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Positive value) positive,
    required TResult Function(_Negative value) negative,
  }) {
    return positive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Negative value)? negative,
  }) {
    return positive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Negative value)? negative,
    required TResult orElse(),
  }) {
    if (positive != null) {
      return positive(this);
    }
    return orElse();
  }
}

abstract class _Positive implements CheckedMenuDialogEvent {
  const factory _Positive(final List<CheckedMenuItem> menuItems) = _$_Positive;

  @override
  List<CheckedMenuItem> get menuItems;
  @override
  @JsonKey(ignore: true)
  _$$_PositiveCopyWith<_$_Positive> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NegativeCopyWith<$Res>
    implements $CheckedMenuDialogEventCopyWith<$Res> {
  factory _$$_NegativeCopyWith(
          _$_Negative value, $Res Function(_$_Negative) then) =
      __$$_NegativeCopyWithImpl<$Res>;
  @override
  $Res call({List<CheckedMenuItem> menuItems});
}

/// @nodoc
class __$$_NegativeCopyWithImpl<$Res>
    extends _$CheckedMenuDialogEventCopyWithImpl<$Res>
    implements _$$_NegativeCopyWith<$Res> {
  __$$_NegativeCopyWithImpl(
      _$_Negative _value, $Res Function(_$_Negative) _then)
      : super(_value, (v) => _then(v as _$_Negative));

  @override
  _$_Negative get _value => super._value as _$_Negative;

  @override
  $Res call({
    Object? menuItems = freezed,
  }) {
    return _then(_$_Negative(
      menuItems == freezed
          ? _value._menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<CheckedMenuItem>,
    ));
  }
}

/// @nodoc

class _$_Negative implements _Negative {
  const _$_Negative(final List<CheckedMenuItem> menuItems)
      : _menuItems = menuItems;

  final List<CheckedMenuItem> _menuItems;
  @override
  List<CheckedMenuItem> get menuItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_menuItems);
  }

  @override
  String toString() {
    return 'CheckedMenuDialogEvent.negative(menuItems: $menuItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Negative &&
            const DeepCollectionEquality()
                .equals(other._menuItems, _menuItems));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_menuItems));

  @JsonKey(ignore: true)
  @override
  _$$_NegativeCopyWith<_$_Negative> get copyWith =>
      __$$_NegativeCopyWithImpl<_$_Negative>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckedMenuItem> menuItems) positive,
    required TResult Function(List<CheckedMenuItem> menuItems) negative,
  }) {
    return negative(menuItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckedMenuItem> menuItems)? positive,
    TResult Function(List<CheckedMenuItem> menuItems)? negative,
  }) {
    return negative?.call(menuItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckedMenuItem> menuItems)? positive,
    TResult Function(List<CheckedMenuItem> menuItems)? negative,
    required TResult orElse(),
  }) {
    if (negative != null) {
      return negative(menuItems);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Positive value) positive,
    required TResult Function(_Negative value) negative,
  }) {
    return negative(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Negative value)? negative,
  }) {
    return negative?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Positive value)? positive,
    TResult Function(_Negative value)? negative,
    required TResult orElse(),
  }) {
    if (negative != null) {
      return negative(this);
    }
    return orElse();
  }
}

abstract class _Negative implements CheckedMenuDialogEvent {
  const factory _Negative(final List<CheckedMenuItem> menuItems) = _$_Negative;

  @override
  List<CheckedMenuItem> get menuItems;
  @override
  @JsonKey(ignore: true)
  _$$_NegativeCopyWith<_$_Negative> get copyWith =>
      throw _privateConstructorUsedError;
}
