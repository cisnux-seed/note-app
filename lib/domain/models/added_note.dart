import 'package:freezed_annotation/freezed_annotation.dart';

part 'added_note.freezed.dart';

@freezed
abstract class AddedNote with _$AddedNote {
  const factory AddedNote({
    required dynamic id,
    required String title,
    required String lastUpdatedAt,
  }) = _AddedNote;
}
