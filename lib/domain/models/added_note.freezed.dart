// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'added_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddedNote {
  dynamic get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get lastUpdatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddedNoteCopyWith<AddedNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddedNoteCopyWith<$Res> {
  factory $AddedNoteCopyWith(AddedNote value, $Res Function(AddedNote) then) =
      _$AddedNoteCopyWithImpl<$Res, AddedNote>;
  @useResult
  $Res call({dynamic id, String title, String lastUpdatedAt});
}

/// @nodoc
class _$AddedNoteCopyWithImpl<$Res, $Val extends AddedNote>
    implements $AddedNoteCopyWith<$Res> {
  _$AddedNoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? lastUpdatedAt = null,
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
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddedNoteCopyWith<$Res> implements $AddedNoteCopyWith<$Res> {
  factory _$$_AddedNoteCopyWith(
          _$_AddedNote value, $Res Function(_$_AddedNote) then) =
      __$$_AddedNoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, String title, String lastUpdatedAt});
}

/// @nodoc
class __$$_AddedNoteCopyWithImpl<$Res>
    extends _$AddedNoteCopyWithImpl<$Res, _$_AddedNote>
    implements _$$_AddedNoteCopyWith<$Res> {
  __$$_AddedNoteCopyWithImpl(
      _$_AddedNote _value, $Res Function(_$_AddedNote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_$_AddedNote(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddedNote implements _AddedNote {
  const _$_AddedNote(
      {required this.id, required this.title, required this.lastUpdatedAt});

  @override
  final dynamic id;
  @override
  final String title;
  @override
  final String lastUpdatedAt;

  @override
  String toString() {
    return 'AddedNote(id: $id, title: $title, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddedNote &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(id), title, lastUpdatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddedNoteCopyWith<_$_AddedNote> get copyWith =>
      __$$_AddedNoteCopyWithImpl<_$_AddedNote>(this, _$identity);
}

abstract class _AddedNote implements AddedNote {
  const factory _AddedNote(
      {required final dynamic id,
      required final String title,
      required final String lastUpdatedAt}) = _$_AddedNote;

  @override
  dynamic get id;
  @override
  String get title;
  @override
  String get lastUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AddedNoteCopyWith<_$_AddedNote> get copyWith =>
      throw _privateConstructorUsedError;
}
