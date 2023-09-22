import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/utils/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/models/added_note.dart';
import '../../../service_locators/service_locator.dart';

part 'home_provider.g.dart';

final searchProvider = StateProvider.autoDispose((_) => '');

@riverpod
Stream<List<String>> suggestions(SuggestionsRef ref) async* {
  await Future.delayed(const Duration(microseconds: 350));
  final query = ref.watch(searchProvider);
  if (query.isBlank) {
    yield [];
  } else {
    final noteUseCase = await ref.watch(noteUseCaseProvider.future);
    yield* noteUseCase.getNoteSuggestions(query: query);
  }
}

@riverpod
Stream<List<AddedNote>> notes(NotesRef ref) async* {
  ref.state = const AsyncValue.loading();
  final query = ref.watch(searchProvider);
  final noteUseCase = await ref.watch(noteUseCaseProvider.future);
  final notes = query.isBlank
      ? noteUseCase.notes
      : noteUseCase.getNotesBySuggestion(query: query);
  yield* notes;
}
