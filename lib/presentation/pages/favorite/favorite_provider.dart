import 'package:note_app/domain/models/favorite_note.dart';
import 'package:note_app/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../service_locators/service_locator.dart';

part 'favorite_provider.g.dart';

@riverpod
Stream<List<FavoriteNote>> favoriteNotes(FavoriteNotesRef ref) async* {
  final noteUseCase = await ref.watch(noteUseCaseProvider.future);
  final favoriteNotes = noteUseCase.favoriteNotes;
  yield* favoriteNotes;
}

@riverpod
Future<void> swipeNote(
  SwipeNoteRef ref, {
  required FavoriteNote favoriteNote,
}) async {
  final upsertNote = await ref.watch(
    noteUseCaseProvider.selectAsync((noteUseCase) => noteUseCase.upsertNote),
  );
  await upsertNote(noteDetail: favoriteNote.asNoteDetail);
}
