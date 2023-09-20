import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'note_entity.freezed.dart';
part 'note_entity.g.dart';

@freezed
abstract class NoteEntity extends HiveObject with _$NoteEntity {
  NoteEntity._();

  @HiveType(typeId: 1)
  factory NoteEntity({
    @HiveField(0) required String title,
    @HiveField(1) required String body,
    @HiveField(2, defaultValue: false) @Default(false) bool isFavorite,
    @HiveField(3) required DateTime lastUpdatedAt,
  })= _NoteEntity;
}