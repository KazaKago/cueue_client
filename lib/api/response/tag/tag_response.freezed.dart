// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagResponse _$TagResponseFromJson(Map<String, dynamic> json) {
  return _TagResponse.fromJson(json);
}

/// @nodoc
mixin _$TagResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagResponseCopyWith<TagResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagResponseCopyWith<$Res> {
  factory $TagResponseCopyWith(
          TagResponse value, $Res Function(TagResponse) then) =
      _$TagResponseCopyWithImpl<$Res, TagResponse>;
  @useResult
  $Res call({@JsonKey(name: 'id') int id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class _$TagResponseCopyWithImpl<$Res, $Val extends TagResponse>
    implements $TagResponseCopyWith<$Res> {
  _$TagResponseCopyWithImpl(this._value, this._then);

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
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagResponseImplCopyWith<$Res>
    implements $TagResponseCopyWith<$Res> {
  factory _$$TagResponseImplCopyWith(
          _$TagResponseImpl value, $Res Function(_$TagResponseImpl) then) =
      __$$TagResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$TagResponseImplCopyWithImpl<$Res>
    extends _$TagResponseCopyWithImpl<$Res, _$TagResponseImpl>
    implements _$$TagResponseImplCopyWith<$Res> {
  __$$TagResponseImplCopyWithImpl(
      _$TagResponseImpl _value, $Res Function(_$TagResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$TagResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TagResponseImpl implements _TagResponse {
  const _$TagResponseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name});

  factory _$TagResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TagResponseImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'id')
  final int id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'TagResponse(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagResponseImplCopyWith<_$TagResponseImpl> get copyWith =>
      __$$TagResponseImplCopyWithImpl<_$TagResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TagResponseImplToJson(
      this,
    );
  }
}

abstract class _TagResponse implements TagResponse {
  const factory _TagResponse(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name}) = _$TagResponseImpl;

  factory _TagResponse.fromJson(Map<String, dynamic> json) =
      _$TagResponseImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$TagResponseImplCopyWith<_$TagResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
