// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workspace_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkspaceRequest _$WorkspaceRequestFromJson(Map<String, dynamic> json) {
  return _WorkspaceRequest.fromJson(json);
}

/// @nodoc
mixin _$WorkspaceRequest {
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkspaceRequestCopyWith<WorkspaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceRequestCopyWith<$Res> {
  factory $WorkspaceRequestCopyWith(
          WorkspaceRequest value, $Res Function(WorkspaceRequest) then) =
      _$WorkspaceRequestCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class _$WorkspaceRequestCopyWithImpl<$Res>
    implements $WorkspaceRequestCopyWith<$Res> {
  _$WorkspaceRequestCopyWithImpl(this._value, this._then);

  final WorkspaceRequest _value;
  // ignore: unused_field
  final $Res Function(WorkspaceRequest) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_WorkspaceRequestCopyWith<$Res>
    implements $WorkspaceRequestCopyWith<$Res> {
  factory _$$_WorkspaceRequestCopyWith(
          _$_WorkspaceRequest value, $Res Function(_$_WorkspaceRequest) then) =
      __$$_WorkspaceRequestCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$_WorkspaceRequestCopyWithImpl<$Res>
    extends _$WorkspaceRequestCopyWithImpl<$Res>
    implements _$$_WorkspaceRequestCopyWith<$Res> {
  __$$_WorkspaceRequestCopyWithImpl(
      _$_WorkspaceRequest _value, $Res Function(_$_WorkspaceRequest) _then)
      : super(_value, (v) => _then(v as _$_WorkspaceRequest));

  @override
  _$_WorkspaceRequest get _value => super._value as _$_WorkspaceRequest;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_WorkspaceRequest(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkspaceRequest implements _WorkspaceRequest {
  const _$_WorkspaceRequest({@JsonKey(name: 'name') required this.name});

  factory _$_WorkspaceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_WorkspaceRequestFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'WorkspaceRequest(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkspaceRequest &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_WorkspaceRequestCopyWith<_$_WorkspaceRequest> get copyWith =>
      __$$_WorkspaceRequestCopyWithImpl<_$_WorkspaceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkspaceRequestToJson(this);
  }
}

abstract class _WorkspaceRequest implements WorkspaceRequest {
  const factory _WorkspaceRequest(
          {@JsonKey(name: 'name') required final String name}) =
      _$_WorkspaceRequest;

  factory _WorkspaceRequest.fromJson(Map<String, dynamic> json) =
      _$_WorkspaceRequest.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_WorkspaceRequestCopyWith<_$_WorkspaceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
