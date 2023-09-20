import 'databases/note_entity.dart';

abstract interface class LocalNoteSource {
  Future<void> addNoteEntity({required NoteEntity noteEntity});

  Stream<List<NoteEntity>> getNoteEntities();

  Future<void> deleteNoteEntityById({required dynamic id});

  Future<void> updateNoteEntityById({required dynamic id, required NoteEntity noteEntity});

  NoteEntity? getNoteEntityById({required dynamic id});
}
