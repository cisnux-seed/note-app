import 'package:hive/hive.dart';
import 'package:note_app/data/sources/locals/databases/note_entity.dart';
import 'local_note_source.dart';

final class LocalNoteSourceImpl implements LocalNoteSource {
  LocalNoteSourceImpl({required this.noteBox});

  final Box<NoteEntity> noteBox;

  @override
  Future<void> addNoteEntity({required NoteEntity noteEntity}) async =>
      await noteBox.add(noteEntity);

  @override
  Future<void> deleteNoteEntityById({required id}) async =>
      await noteBox.delete(int.parse(id.toString()));

  @override
  NoteEntity? getNoteEntityById({required id}) =>
      noteBox.get(int.parse(id.toString()));

  @override
  Stream<List<NoteEntity>> getNoteEntities() async* {
    // initialize first
    yield noteBox.values.toList();
    // then so on
    yield* noteBox.watch()
        .map((_) => noteBox.values.toList());
  }

  @override
  Future<void> updateNoteEntityById(
          {required id, required NoteEntity noteEntity}) async =>
      await noteBox.put(int.parse(id.toString()), noteEntity);
}
