// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'menu_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MenuRegistrationTearOff {
  const _$MenuRegistrationTearOff();

  _MenuRegistration call(
      {required String memo,
      required DateTime date,
      required TimeFrame timeFrame,
      required List<RecipeId> recipeIds}) {
    return _MenuRegistration(
      memo: memo,
      date: date,
      timeFrame: timeFrame,
      recipeIds: recipeIds,
    );
  }
}

/// @nodoc
const $MenuRegistration = _$MenuRegistrationTearOff();

/// @nodoc
mixin _$MenuRegistration {
  String get memo => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  TimeFrame get timeFrame => throw _privateConstructorUsedError;
  List<RecipeId> get recipeIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuRegistrationCopyWith<MenuRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuRegistrationCopyWith<$Res> {
  factory $MenuRegistrationCopyWith(
          MenuRegistration value, $Res Function(MenuRegistration) then) =
      _$MenuRegistrationCopyWithImpl<$Res>;
  $Res call(
      {String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeId> recipeIds});
}

/// @nodoc
class _$MenuRegistrationCopyWithImpl<$Res>
    implements $MenuRegistrationCopyWith<$Res> {
  _$MenuRegistrationCopyWithImpl(this._value, this._then);

  final MenuRegistration _value;
  // ignore: unused_field
  final $Res Function(MenuRegistration) _then;

  @override
  $Res call({
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipeIds = freezed,
  }) {
    return _then(_value.copyWith(
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
      recipeIds: recipeIds == freezed
          ? _value.recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<RecipeId>,
    ));
  }
}

/// @nodoc
abstract class _$MenuRegistrationCopyWith<$Res>
    implements $MenuRegistrationCopyWith<$Res> {
  factory _$MenuRegistrationCopyWith(
          _MenuRegistration value, $Res Function(_MenuRegistration) then) =
      __$MenuRegistrationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeId> recipeIds});
}

/// @nodoc
class __$MenuRegistrationCopyWithImpl<$Res>
    extends _$MenuRegistrationCopyWithImpl<$Res>
    implements _$MenuRegistrationCopyWith<$Res> {
  __$MenuRegistrationCopyWithImpl(
      _MenuRegistration _value, $Res Function(_MenuRegistration) _then)
      : super(_value, (v) => _then(v as _MenuRegistration));

  @override
  _MenuRegistration get _value => super._value as _MenuRegistration;

  @override
  $Res call({
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipeIds = freezed,
  }) {
    return _then(_MenuRegistration(
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
      recipeIds: recipeIds == freezed
          ? _value.recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<RecipeId>,
    ));
  }
}

/// @nodoc

class _$_MenuRegistration implements _MenuRegistration {
  const _$_MenuRegistration(
      {required this.memo,
      required this.date,
      required this.timeFrame,
      required this.recipeIds});

  @override
  final String memo;
  @override
  final DateTime date;
  @override
  final TimeFrame timeFrame;
  @override
  final List<RecipeId> recipeIds;

  @override
  String toString() {
    return 'MenuRegistration(memo: $memo, date: $date, timeFrame: $timeFrame, recipeIds: $recipeIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MenuRegistration &&
            (identical(other.memo, memo) ||
                const DeepCollectionEquality().equals(other.memo, memo)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.timeFrame, timeFrame) ||
                const DeepCollectionEquality()
                    .equals(other.timeFrame, timeFrame)) &&
            (identical(other.recipeIds, recipeIds) ||
                const DeepCollectionEquality()
                    .equals(other.recipeIds, recipeIds)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(memo) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(timeFrame) ^
      const DeepCollectionEquality().hash(recipeIds);

  @JsonKey(ignore: true)
  @override
  _$MenuRegistrationCopyWith<_MenuRegistration> get copyWith =>
      __$MenuRegistrationCopyWithImpl<_MenuRegistration>(this, _$identity);
}

abstract class _MenuRegistration implements MenuRegistration {
  const factory _MenuRegistration(
      {required String memo,
      required DateTime date,
      required TimeFrame timeFrame,
      required List<RecipeId> recipeIds}) = _$_MenuRegistration;

  @override
  String get memo => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  TimeFrame get timeFrame => throw _privateConstructorUsedError;
  @override
  List<RecipeId> get recipeIds => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MenuRegistrationCopyWith<_MenuRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
