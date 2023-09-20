import 'package:note_app/domain/models/added_note.dart';
import 'package:note_app/domain/models/favorite_note.dart';
import 'package:note_app/domain/models/note_detail.dart';

abstract interface class NoteUseCase {
  Stream<List<AddedNote>> get notes;

  Stream<List<FavoriteNote>> get favoriteNotes;

  Stream<List<String>> getNoteSuggestions({required String query});

  Stream<List<AddedNote>> getNotesBySuggestion({required String query});

  NoteDetail? getNoteDetailById({required dynamic id});

  Future<void> deleteNoteById({required dynamic id});

  Future<void> upsertNote({required NoteDetail noteDetail});
}
