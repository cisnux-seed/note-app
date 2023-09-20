import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/models/note_detail.dart';
import '../../../service_locators/service_locator.dart';

part 'note_detail_provider.g.dart';

final readModeProvider = StateProvider.autoDispose((_) => false);
final favoriteNoteProvider = StateProvider.autoDispose((_) => false);

@riverpod
Future<NoteDetail?> noteDetail(NoteDetailRef ref, {required dynamic id}) async {
  final noteUseCase = await ref.watch(
    noteUseCaseProvider.future,
  );
  return noteUseCase.getNoteDetailById(id: id);
}

@riverpod
Future<void> upsert(
  UpsertRef ref, {
  required dynamic id,
  required String title,
  required String body,
  required bool isFavorite,
}) async {
  final upsertNote = await ref.watch(
      noteUseCaseProvider.selectAsync((noteUseCase) => noteUseCase.upsertNote));
  final newNote =
      NoteDetail(id: id, title: title, body: body, isFavorite: isFavorite);
  await upsertNote(noteDetail: newNote);
}

@riverpod
Future<void> delete(DeleteRef ref, {required dynamic id}) async {
  final deleteNoteById = await ref.watch(noteUseCaseProvider
      .selectAsync((noteUseCase) => noteUseCase.deleteNoteById));
  await deleteNoteById(id: id);
}
