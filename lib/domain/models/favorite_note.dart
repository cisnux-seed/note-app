import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_note.freezed.dart';

@freezed
abstract class FavoriteNote with _$FavoriteNote {
  const factory FavoriteNote({
    required dynamic id,
    required String title,
    required String lastUpdatedAt,
    required String body,
    required bool isFavorite,
  }) = _FavoriteNote;
}