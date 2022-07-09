// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$RecipeSearchOptionCopyWithImpl<$Res>;
  $Res call({String? keyword, List<TagId>? tagIds});
}

/// @nodoc
class _$RecipeSearchOptionCopyWithImpl<$Res>
    implements $RecipeSearchOptionCopyWith<$Res> {
  _$RecipeSearchOptionCopyWithImpl(this._value, this._then);

  final RecipeSearchOption _value;
  // ignore: unused_field
  final $Res Function(RecipeSearchOption) _then;

  @override
  $Res call({
    Object? keyword = freezed,
    Object? tagIds = freezed,
  }) {
    return _then(_value.copyWith(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      tagIds: tagIds == freezed
          ? _value.tagIds
          : tagIds // ignore: cast_nullable_to_non_nullable
              as List<TagId>?,
    ));
  }
}

/// @nodoc
abstract class _$$_RecipeSearchOptionCopyWith<$Res>
    implements $RecipeSearchOptionCopyWith<$Res> {
  factory _$$_RecipeSearchOptionCopyWith(_$_RecipeSearchOption value,
          $Res Function(_$_RecipeSearchOption) then) =
      __$$_RecipeSearchOptionCopyWithImpl<$Res>;
  @override
  $Res call({String? keyword, List<TagId>? tagIds});
}

/// @nodoc
class __$$_RecipeSearchOptionCopyWithImpl<$Res>
    extends _$RecipeSearchOptionCopyWithImpl<$Res>
    implements _$$_RecipeSearchOptionCopyWith<$Res> {
  __$$_RecipeSearchOptionCopyWithImpl(
      _$_RecipeSearchOption _value, $Res Function(_$_RecipeSearchOption) _then)
      : super(_value, (v) => _then(v as _$_RecipeSearchOption));

  @override
  _$_RecipeSearchOption get _value => super._value as _$_RecipeSearchOption;

  @override
  $Res call({
    Object? keyword = freezed,
    Object? tagIds = freezed,
  }) {
    return _then(_$_RecipeSearchOption(
      keyword: keyword == freezed
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      tagIds: tagIds == freezed
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
            const DeepCollectionEquality().equals(other.keyword, keyword) &&
            const DeepCollectionEquality().equals(other._tagIds, _tagIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(keyword),
      const DeepCollectionEquality().hash(_tagIds));

  @JsonKey(ignore: true)
  @override
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
