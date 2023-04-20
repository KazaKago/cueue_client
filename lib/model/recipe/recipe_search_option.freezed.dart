// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_search_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipeSearchOption {
  String? get keyword => throw _privateConstructorUsedError;
  List<TagId>? get tagIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecipeSearchOptionCopyWith<RecipeSearchOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeSearchOptionCopyWith<$Res> {
  factory $RecipeSearchOptionCopyWith(
          RecipeSearchOption value, $Res Function(RecipeSearchOption) then) =
      _$RecipeSearchOptionCopyWithImpl<$Res, RecipeSearchOption>;
  @useResult
  $Res call({String? keyword, List<TagId>? tagIds});
}

/// @nodoc
class _$RecipeSearchOptionCopyWithImpl<$Res, $Val extends RecipeSearchOption>
    implements $RecipeSearchOptionCopyWith<$Res> {
  _$RecipeSearchOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? tagIds = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      tagIds: freezed == tagIds
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagId>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeSearchOptionCopyWith<$Res>
    implements $RecipeSearchOptionCopyWith<$Res> {
  factory _$$_RecipeSearchOptionCopyWith(_$_RecipeSearchOption value,
          $Res Function(_$_RecipeSearchOption) then) =
      __$$_RecipeSearchOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? keyword, List<TagId>? tagIds});
}

/// @nodoc
class __$$_RecipeSearchOptionCopyWithImpl<$Res>
    extends _$RecipeSearchOptionCopyWithImpl<$Res, _$_RecipeSearchOption>
    implements _$$_RecipeSearchOptionCopyWith<$Res> {
  __$$_RecipeSearchOptionCopyWithImpl(
      _$_RecipeSearchOption _value, $Res Function(_$_RecipeSearchOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? tagIds = freezed,
  }) {
    return _then(_$_RecipeSearchOption(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      tagIds: freezed == tagIds
          ? _value._tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagId>?,
    ));
  }
}

/// @nodoc

class _$_RecipeSearchOption implements _RecipeSearchOption {
  const _$_RecipeSearchOption({this.keyword, final List<TagId>? tagIds})
      : _tagIds = tagIds;

  @override
  final String? keyword;
  final List<TagId>? _tagIds;
  @override
  List<TagId>? get tagIds {
    final value = _tagIds;
    if (value == null) return null;
    if (_tagIds is EqualUnmodifiableListView) return _tagIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecipeSearchOption._(keyword: $keyword, tagIds: $tagIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeSearchOption &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, keyword, const DeepCollectionEquality().hash(_tagIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeSearchOptionCopyWith<_$_RecipeSearchOption> get copyWith =>
      __$$_RecipeSearchOptionCopyWithImpl<_$_RecipeSearchOption>(
          this, _$identity);
}

abstract class _RecipeSearchOption implements RecipeSearchOption {
  const factory _RecipeSearchOption(
      {final String? keyword,
      final List<TagId>? tagIds}) = _$_RecipeSearchOption;

  @override
  String? get keyword;
  @override
  List<TagId>? get tagIds;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeSearchOptionCopyWith<_$_RecipeSearchOption> get copyWith =>
      throw _privateConstructorUsedError;
}
