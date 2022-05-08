// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'menu_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$_MenuRegistrationCopyWith<$Res>
    implements $MenuRegistrationCopyWith<$Res> {
  factory _$$_MenuRegistrationCopyWith(
          _$_MenuRegistration value, $Res Function(_$_MenuRegistration) then) =
      __$$_MenuRegistrationCopyWithImpl<$Res>;
  @override
  $Res call(
      {String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeId> recipeIds});
}

/// @nodoc
class __$$_MenuRegistrationCopyWithImpl<$Res>
    extends _$MenuRegistrationCopyWithImpl<$Res>
    implements _$$_MenuRegistrationCopyWith<$Res> {
  __$$_MenuRegistrationCopyWithImpl(
      _$_MenuRegistration _value, $Res Function(_$_MenuRegistration) _then)
      : super(_value, (v) => _then(v as _$_MenuRegistration));

  @override
  _$_MenuRegistration get _value => super._value as _$_MenuRegistration;

  @override
  $Res call({
    Object? memo = freezed,
    Object? date = freezed,
    Object? timeFrame = freezed,
    Object? recipeIds = freezed,
  }) {
    return _then(_$_MenuRegistration(
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
          ? _value._recipeIds
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
      required final List<RecipeId> recipeIds})
      : _recipeIds = recipeIds;

  @override
  final String memo;
  @override
  final DateTime date;
  @override
  final TimeFrame timeFrame;
  final List<RecipeId> _recipeIds;
  @override
  List<RecipeId> get recipeIds {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeIds);
  }

  @override
  String toString() {
    return 'MenuRegistration(memo: $memo, date: $date, timeFrame: $timeFrame, recipeIds: $recipeIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuRegistration &&
            const DeepCollectionEquality().equals(other.memo, memo) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.timeFrame, timeFrame) &&
            const DeepCollectionEquality()
                .equals(other._recipeIds, _recipeIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(memo),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(timeFrame),
      const DeepCollectionEquality().hash(_recipeIds));

  @JsonKey(ignore: true)
  @override
  _$$_MenuRegistrationCopyWith<_$_MenuRegistration> get copyWith =>
      __$$_MenuRegistrationCopyWithImpl<_$_MenuRegistration>(this, _$identity);
}

abstract class _MenuRegistration implements MenuRegistration {
  const factory _MenuRegistration(
      {required final String memo,
      required final DateTime date,
      required final TimeFrame timeFrame,
      required final List<RecipeId> recipeIds}) = _$_MenuRegistration;

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
  _$$_MenuRegistrationCopyWith<_$_MenuRegistration> get copyWith =>
      throw _privateConstructorUsedError;
}
