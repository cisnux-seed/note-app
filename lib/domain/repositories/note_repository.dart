import 'package:note_app/domain/models/favorite_note.dart';

import '../models/added_note.dart';
import '../models/note_detail.dart';

abstract interface class NoteRepository {
  Stream<List<AddedNote>> get notes;

  Stream<List<FavoriteNote>> get favoriteNotes;

  NoteDetail? getNoteDetailById({required dynamic id});

  Future<void> deleteNoteById({required dynamic id});

  Future<void> upsertNote({required NoteDetail noteDetail});

  Stream<List<String>> getNoteSuggestions({required String query});

  Stream<List<AddedNote>> getNotesBySuggestion({required String query});
}
