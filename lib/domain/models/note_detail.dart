import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_detail.freezed.dart';

@freezed
abstract class NoteDetail with _$NoteDetail {
  const factory NoteDetail({
    dynamic id,
    required String title,
    required String body,
    @Default(false) bool isFavorite,
  }) = _NoteDetail;
}