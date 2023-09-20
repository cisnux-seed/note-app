import 'package:note_app/data/sources/locals/local_note_source.dart';
import 'package:note_app/domain/models/added_note.dart';
import 'package:note_app/domain/models/favorite_note.dart';
import 'package:note_app/domain/models/note_detail.dart';
import 'package:note_app/domain/repositories/note_repository.dart';
import 'package:note_app/utils/extensions.dart';

final class NoteRepositoryImpl implements NoteRepository {
  NoteRepositoryImpl({required this.localNoteSource});

  final LocalNoteSource localNoteSource;

  @override
  Stream<List<AddedNote>> get notes =>
      localNoteSource.getNoteEntities().distinct().map(
            (noteEntities) => noteEntities
                .map(
                  (noteEntity) => noteEntity.asAddedNote,
                )
                .toList(),
          );

  @override
  Future<void> deleteNoteById({required id}) async =>
      await localNoteSource.deleteNoteEntityById(id: id);

  @override
  Future<void> upsertNote({required NoteDetail noteDetail}) async {
    final noteEntity = noteDetail.asNoteEntity;
    if (noteDetail.id != null) {
      await localNoteSource.updateNoteEntityById(
          id: noteDetail.id, noteEntity: noteEntity);
    } else {
      await localNoteSource.addNoteEntity(noteEntity: noteEntity);
    }
  }

  @override
  NoteDetail? getNoteDetailById({required id}) =>
      localNoteSource.getNoteEntityById(id: id)?.asNoteDetail;

  @override
  Stream<List<String>> getNoteSuggestions({required String query}) =>
      localNoteSource.getNoteEntities().distinct().map(
            (noteEntities) => noteEntities
                .map(
                  (noteEntity) => noteEntity.title,
                )
                .where((title) =>
                    title.toLowerCase().contains(query.toLowerCase()))
                .toList(),
          );

  @override
  Stream<List<AddedNote>> getNotesBySuggestion({required String query}) =>
      localNoteSource.getNoteEntities().distinct().map(
            (noteEntities) => noteEntities
                .where(
                  (note) =>
                      note.title.toLowerCase().contains(query.toLowerCase()) ||
                      note.body.toLowerCase().contains(query.toLowerCase()),
                )
                .map(
                  (noteEntity) => noteEntity.asAddedNote,
                )
                .toList(),
          );

  @override
  Stream<List<FavoriteNote>> get favoriteNotes =>
      localNoteSource.getNoteEntities().distinct().map(
            (noteEntities) => noteEntities
                .where(
                  (note) => note.isFavorite,
                )
                .map(
                  (noteEntity) => noteEntity.asFavoriteNote,
                )
                .toList(),
          );
}
