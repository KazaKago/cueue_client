// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Tag {
  TagId get id => throw _privateConstructorUsedError;

  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagCopyWith<Tag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagCopyWith<$Res> {
  factory $TagCopyWith(Tag value, $Res Function(Tag) then) = _$TagCopyWithImpl<$Res, Tag>;

  @useResult
  $Res call({TagId id, String name});

  $TagIdCopyWith<$Res> get id;
}

/// @nodoc
class _$TagCopyWithImpl<$Res, $Val extends Tag> implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TagId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TagIdCopyWith<$Res> get id {
    return $TagIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$$_TagCopyWith(_$_Tag value, $Res Function(_$_Tag) then) = __$$_TagCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({TagId id, String name});

  @override
  $TagIdCopyWith<$Res> get id;
}

/// @nodoc
class __$$_TagCopyWithImpl<$Res> extends _$TagCopyWithImpl<$Res, _$_Tag> implements _$$_TagCopyWith<$Res> {
  __$$_TagCopyWithImpl(_$_Tag _value, $Res Function(_$_Tag) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Tag(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as TagId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Tag implements _Tag {
  const _$_Tag({required this.id, required this.name});

  @override
  final TagId id;
  @override
  final String name;

  @override
  String toString() {
    return 'Tag(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_Tag && (identical(other.id, id) || other.id == id) && (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TagCopyWith<_$_Tag> get copyWith => __$$_TagCopyWithImpl<_$_Tag>(this, _$identity);
}

abstract class _Tag implements Tag {
  const factory _Tag({required final TagId id, required final String name}) = _$_Tag;

  @override
  TagId get id;

  @override
  String get name;

  @override
  @JsonKey(ignore: true)
  _$$_TagCopyWith<_$_Tag> get copyWith => throw _privateConstructorUsedError;
}
