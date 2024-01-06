// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$MenuRegistrationCopyWithImpl<$Res, MenuRegistration>;
  @useResult
  $Res call(
      {String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeId> recipeIds});
}

/// @nodoc
class _$MenuRegistrationCopyWithImpl<$Res, $Val extends MenuRegistration>
    implements $MenuRegistrationCopyWith<$Res> {
  _$MenuRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memo = null,
    Object? date = null,
    Object? timeFrame = null,
    Object? recipeIds = null,
  }) {
    return _then(_value.copyWith(
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
      recipeIds: null == recipeIds
          ? _value.recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<RecipeId>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuRegistrationImplCopyWith<$Res>
    implements $MenuRegistrationCopyWith<$Res> {
  factory _$$MenuRegistrationImplCopyWith(_$MenuRegistrationImpl value,
          $Res Function(_$MenuRegistrationImpl) then) =
      __$$MenuRegistrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String memo,
      DateTime date,
      TimeFrame timeFrame,
      List<RecipeId> recipeIds});
}

/// @nodoc
class __$$MenuRegistrationImplCopyWithImpl<$Res>
    extends _$MenuRegistrationCopyWithImpl<$Res, _$MenuRegistrationImpl>
    implements _$$MenuRegistrationImplCopyWith<$Res> {
  __$$MenuRegistrationImplCopyWithImpl(_$MenuRegistrationImpl _value,
      $Res Function(_$MenuRegistrationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memo = null,
    Object? date = null,
    Object? timeFrame = null,
    Object? recipeIds = null,
  }) {
    return _then(_$MenuRegistrationImpl(
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
      recipeIds: null == recipeIds
          ? _value._recipeIds
          : recipeIds // ignore: cast_nullable_to_non_nullable
              as List<RecipeId>,
    ));
  }
}

/// @nodoc

class _$MenuRegistrationImpl implements _MenuRegistration {
  const _$MenuRegistrationImpl(
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
    if (_recipeIds is EqualUnmodifiableListView) return _recipeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeIds);
  }

  @override
  String toString() {
    return 'MenuRegistration(memo: $memo, date: $date, timeFrame: $timeFrame, recipeIds: $recipeIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRegistrationImpl &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.timeFrame, timeFrame) ||
                other.timeFrame == timeFrame) &&
            const DeepCollectionEquality()
                .equals(other._recipeIds, _recipeIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memo, date, timeFrame,
      const DeepCollectionEquality().hash(_recipeIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuRegistrationImplCopyWith<_$MenuRegistrationImpl> get copyWith =>
      __$$MenuRegistrationImplCopyWithImpl<_$MenuRegistrationImpl>(
          this, _$identity);
}

abstract class _MenuRegistration implements MenuRegistration {
  const factory _MenuRegistration(
      {required final String memo,
      required final DateTime date,
      required final TimeFrame timeFrame,
      required final List<RecipeId> recipeIds}) = _$MenuRegistrationImpl;

  @override
  String get memo;
  @override
  DateTime get date;
  @override
  TimeFrame get timeFrame;
  @override
  List<RecipeId> get recipeIds;
  @override
  @JsonKey(ignore: true)
  _$$MenuRegistrationImplCopyWith<_$MenuRegistrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
