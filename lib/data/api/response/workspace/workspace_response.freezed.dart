// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkspaceResponse _$WorkspaceResponseFromJson(Map<String, dynamic> json) {
  return _WorkspaceResponse.fromJson(json);
}

/// @nodoc
class _$WorkspaceResponseTearOff {
  const _$WorkspaceResponseTearOff();

  _WorkspaceResponse call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') required String name}) {
    return _WorkspaceResponse(
      id: id,
      name: name,
    );
  }

  WorkspaceResponse fromJson(Map<String, Object?> json) {
    return WorkspaceResponse.fromJson(json);
  }
}

/// @nodoc
const $WorkspaceResponse = _$WorkspaceResponseTearOff();

/// @nodoc
mixin _$WorkspaceResponse {
// ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceResponseCopyWith<WorkspaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceResponseCopyWith<$Res> {
  factory $WorkspaceResponseCopyWith(
          WorkspaceResponse value, $Res Function(WorkspaceResponse) then) =
      _$WorkspaceResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'id') int id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class _$WorkspaceResponseCopyWithImpl<$Res>
    implements $WorkspaceResponseCopyWith<$Res> {
  _$WorkspaceResponseCopyWithImpl(this._value, this._then);

  final WorkspaceResponse _value;
  // ignore: unused_field
  final $Res Function(WorkspaceResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WorkspaceResponseCopyWith<$Res>
    implements $WorkspaceResponseCopyWith<$Res> {
  factory _$WorkspaceResponseCopyWith(
          _WorkspaceResponse value, $Res Function(_WorkspaceResponse) then) =
      __$WorkspaceResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'id') int id, @JsonKey(name: 'name') String name});
}

/// @nodoc
class __$WorkspaceResponseCopyWithImpl<$Res>
    extends _$WorkspaceResponseCopyWithImpl<$Res>
    implements _$WorkspaceResponseCopyWith<$Res> {
  __$WorkspaceResponseCopyWithImpl(
      _WorkspaceResponse _value, $Res Function(_WorkspaceResponse) _then)
      : super(_value, (v) => _then(v as _WorkspaceResponse));

  @override
  _WorkspaceResponse get _value => super._value as _WorkspaceResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_WorkspaceResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkspaceResponse implements _WorkspaceResponse {
  const _$_WorkspaceResponse(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name});

  factory _$_WorkspaceResponse.fromJson(Map<String, dynamic> json) =>
      _$$_WorkspaceResponseFromJson(json);

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  final int id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'WorkspaceResponse(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkspaceResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  _$WorkspaceResponseCopyWith<_WorkspaceResponse> get copyWith =>
      __$WorkspaceResponseCopyWithImpl<_WorkspaceResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkspaceResponseToJson(this);
  }
}

abstract class _WorkspaceResponse implements WorkspaceResponse {
  const factory _WorkspaceResponse(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'name') required String name}) = _$_WorkspaceResponse;

  factory _WorkspaceResponse.fromJson(Map<String, dynamic> json) =
      _$_WorkspaceResponse.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'id')
  int get id;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$WorkspaceResponseCopyWith<_WorkspaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
