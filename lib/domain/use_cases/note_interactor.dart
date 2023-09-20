import 'package:note_app/domain/models/added_note.dart';
import 'package:note_app/domain/models/favorite_note.dart';
import 'package:note_app/domain/models/note_detail.dart';
import 'package:note_app/domain/repositories/note_repository.dart';
import 'package:note_app/domain/use_cases/note_use_case.dart';

final class NoteInteractor implements NoteUseCase {
  NoteInteractor({required this.noteRepository});

  final NoteRepository noteRepository;

  @override
  Future<void> deleteNoteById({required id}) async =>
      noteRepository.deleteNoteById(id: id);

  @override
  NoteDetail? getNoteDetailById({required id}) =>
      noteRepository.getNoteDetailById(id: id);

  @override
  Stream<List<AddedNote>> get notes => noteRepository.notes;

  @override
  Future<void> upsertNote({required NoteDetail noteDetail}) async =>
      await noteRepository.upsertNote(noteDetail: noteDetail);

  @override
  Stream<List<String>> getNoteSuggestions({required String query}) =>
      noteRepository.getNoteSuggestions(query: query);

  @override
  Stream<List<AddedNote>> getNotesBySuggestion({required String query}) =>
      noteRepository.getNotesBySuggestion(query: query);

  @override
  Stream<List<FavoriteNote>> get favoriteNotes => noteRepository.favoriteNotes;
}
