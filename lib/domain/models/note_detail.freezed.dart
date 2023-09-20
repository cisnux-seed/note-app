// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteDetail {
  dynamic get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteDetailCopyWith<NoteDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteDetailCopyWith<$Res> {
  factory $NoteDetailCopyWith(
          NoteDetail value, $Res Function(NoteDetail) then) =
      _$NoteDetailCopyWithImpl<$Res, NoteDetail>;
  @useResult
  $Res call({dynamic id, String title, String body, bool isFavorite});
}

/// @nodoc
class _$NoteDetailCopyWithImpl<$Res, $Val extends NoteDetail>
    implements $NoteDetailCopyWith<$Res> {
  _$NoteDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? body = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteDetailCopyWith<$Res>
    implements $NoteDetailCopyWith<$Res> {
  factory _$$_NoteDetailCopyWith(
          _$_NoteDetail value, $Res Function(_$_NoteDetail) then) =
      __$$_NoteDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, String title, String body, bool isFavorite});
}

/// @nodoc
class __$$_NoteDetailCopyWithImpl<$Res>
    extends _$NoteDetailCopyWithImpl<$Res, _$_NoteDetail>
    implements _$$_NoteDetailCopyWith<$Res> {
  __$$_NoteDetailCopyWithImpl(
      _$_NoteDetail _value, $Res Function(_$_NoteDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? body = null,
    Object? isFavorite = null,
  }) {
    return _then(_$_NoteDetail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_NoteDetail implements _NoteDetail {
  const _$_NoteDetail(
      {this.id,
      required this.title,
      required this.body,
      this.isFavorite = false});

  @override
  final dynamic id;
  @override
  final String title;
  @override
  final String body;
  @override
  @JsonKey()
  final bool isFavorite;

  @override
  String toString() {
    return 'NoteDetail(id: $id, title: $title, body: $body, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteDetail &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(id), title, body, isFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteDetailCopyWith<_$_NoteDetail> get copyWith =>
      __$$_NoteDetailCopyWithImpl<_$_NoteDetail>(this, _$identity);
}

abstract class _NoteDetail implements NoteDetail {
  const factory _NoteDetail(
      {final dynamic id,
      required final String title,
      required final String body,
      final bool isFavorite}) = _$_NoteDetail;

  @override
  dynamic get id;
  @override
  String get title;
  @override
  String get body;
  @override
  bool get isFavorite;
  @override
  @JsonKey(ignore: true)
  _$$_NoteDetailCopyWith<_$_NoteDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
