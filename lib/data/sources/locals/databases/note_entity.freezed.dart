// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteEntity {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String get body => throw _privateConstructorUsedError;
  @HiveField(2, defaultValue: false)
  bool get isFavorite => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get lastUpdatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteEntityCopyWith<NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteEntityCopyWith<$Res> {
  factory $NoteEntityCopyWith(
          NoteEntity value, $Res Function(NoteEntity) then) =
      _$NoteEntityCopyWithImpl<$Res, NoteEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String body,
      @HiveField(2, defaultValue: false) bool isFavorite,
      @HiveField(3) DateTime lastUpdatedAt});
}

/// @nodoc
class _$NoteEntityCopyWithImpl<$Res, $Val extends NoteEntity>
    implements $NoteEntityCopyWith<$Res> {
  _$NoteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? isFavorite = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_value.copyWith(
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
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NoteEntityCopyWith<$Res>
    implements $NoteEntityCopyWith<$Res> {
  factory _$$_NoteEntityCopyWith(
          _$_NoteEntity value, $Res Function(_$_NoteEntity) then) =
      __$$_NoteEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String body,
      @HiveField(2, defaultValue: false) bool isFavorite,
      @HiveField(3) DateTime lastUpdatedAt});
}

/// @nodoc
class __$$_NoteEntityCopyWithImpl<$Res>
    extends _$NoteEntityCopyWithImpl<$Res, _$_NoteEntity>
    implements _$$_NoteEntityCopyWith<$Res> {
  __$$_NoteEntityCopyWithImpl(
      _$_NoteEntity _value, $Res Function(_$_NoteEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? body = null,
    Object? isFavorite = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_$_NoteEntity(
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
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1)
class _$_NoteEntity extends _NoteEntity {
  _$_NoteEntity(
      {@HiveField(0) required this.title,
      @HiveField(1) required this.body,
      @HiveField(2, defaultValue: false) this.isFavorite = false,
      @HiveField(3) required this.lastUpdatedAt})
      : super._();

  @override
  @HiveField(0)
  final String title;
  @override
  @HiveField(1)
  final String body;
  @override
  @JsonKey()
  @HiveField(2, defaultValue: false)
  final bool isFavorite;
  @override
  @HiveField(3)
  final DateTime lastUpdatedAt;

  @override
  String toString() {
    return 'NoteEntity(title: $title, body: $body, isFavorite: $isFavorite, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, body, isFavorite, lastUpdatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NoteEntityCopyWith<_$_NoteEntity> get copyWith =>
      __$$_NoteEntityCopyWithImpl<_$_NoteEntity>(this, _$identity);
}

abstract class _NoteEntity extends NoteEntity {
  factory _NoteEntity(
      {@HiveField(0) required final String title,
      @HiveField(1) required final String body,
      @HiveField(2, defaultValue: false) final bool isFavorite,
      @HiveField(3) required final DateTime lastUpdatedAt}) = _$_NoteEntity;
  _NoteEntity._() : super._();

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  String get body;
  @override
  @HiveField(2, defaultValue: false)
  bool get isFavorite;
  @override
  @HiveField(3)
  DateTime get lastUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_NoteEntityCopyWith<_$_NoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
