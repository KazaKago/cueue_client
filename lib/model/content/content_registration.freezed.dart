// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_registration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ContentRegistration {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(Uri uri) uri,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(Uri uri)? uri,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(Uri uri)? uri,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Uri value) uri,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Uri value)? uri,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Uri value)? uri,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentRegistrationCopyWith<$Res> {
  factory $ContentRegistrationCopyWith(
          ContentRegistration value, $Res Function(ContentRegistration) then) =
      _$ContentRegistrationCopyWithImpl<$Res, ContentRegistration>;
}

/// @nodoc
class _$ContentRegistrationCopyWithImpl<$Res, $Val extends ContentRegistration>
    implements $ContentRegistrationCopyWith<$Res> {
  _$ContentRegistrationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FileCopyWith<$Res> {
  factory _$$_FileCopyWith(_$_File value, $Res Function(_$_File) then) =
      __$$_FileCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$_FileCopyWithImpl<$Res>
    extends _$ContentRegistrationCopyWithImpl<$Res, _$_File>
    implements _$$_FileCopyWith<$Res> {
  __$$_FileCopyWithImpl(_$_File _value, $Res Function(_$_File) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$_File(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$_File implements _File {
  const _$_File({required this.file});

  @override
  final File file;

  @override
  String toString() {
    return 'ContentRegistration.file(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_File &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileCopyWith<_$_File> get copyWith =>
      __$$_FileCopyWithImpl<_$_File>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(Uri uri) uri,
  }) {
    return file(this.file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(Uri uri)? uri,
  }) {
    return file?.call(this.file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(Uri uri)? uri,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this.file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Uri value) uri,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Uri value)? uri,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Uri value)? uri,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }
}

abstract class _File implements ContentRegistration {
  const factory _File({required final File file}) = _$_File;

  File get file;
  @JsonKey(ignore: true)
  _$$_FileCopyWith<_$_File> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UriCopyWith<$Res> {
  factory _$$_UriCopyWith(_$_Uri value, $Res Function(_$_Uri) then) =
      __$$_UriCopyWithImpl<$Res>;
  @useResult
  $Res call({Uri uri});
}

/// @nodoc
class __$$_UriCopyWithImpl<$Res>
    extends _$ContentRegistrationCopyWithImpl<$Res, _$_Uri>
    implements _$$_UriCopyWith<$Res> {
  __$$_UriCopyWithImpl(_$_Uri _value, $Res Function(_$_Uri) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uri = null,
  }) {
    return _then(_$_Uri(
      uri: null == uri
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as Uri,
    ));
  }
}

/// @nodoc

class _$_Uri implements _Uri {
  const _$_Uri({required this.uri});

  @override
  final Uri uri;

  @override
  String toString() {
    return 'ContentRegistration.uri(uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Uri &&
            (identical(other.uri, uri) || other.uri == uri));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uri);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UriCopyWith<_$_Uri> get copyWith =>
      __$$_UriCopyWithImpl<_$_Uri>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) file,
    required TResult Function(Uri uri) uri,
  }) {
    return uri(this.uri);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? file,
    TResult? Function(Uri uri)? uri,
  }) {
    return uri?.call(this.uri);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? file,
    TResult Function(Uri uri)? uri,
    required TResult orElse(),
  }) {
    if (uri != null) {
      return uri(this.uri);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_File value) file,
    required TResult Function(_Uri value) uri,
  }) {
    return uri(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_File value)? file,
    TResult? Function(_Uri value)? uri,
  }) {
    return uri?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_File value)? file,
    TResult Function(_Uri value)? uri,
    required TResult orElse(),
  }) {
    if (uri != null) {
      return uri(this);
    }
    return orElse();
  }
}

abstract class _Uri implements ContentRegistration {
  const factory _Uri({required final Uri uri}) = _$_Uri;

  Uri get uri;
  @JsonKey(ignore: true)
  _$$_UriCopyWith<_$_Uri> get copyWith => throw _privateConstructorUsedError;
}
