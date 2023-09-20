import 'package:hive/hive.dart';
import 'package:note_app/data/repositories/note_repository_impl.dart';
import 'package:note_app/data/sources/locals/databases/note_entity.dart';
import 'package:note_app/data/sources/locals/local_note_source.dart';
import 'package:note_app/data/sources/locals/local_note_source_impl.dart';
import 'package:note_app/domain/use_cases/note_interactor.dart';
import 'package:note_app/domain/use_cases/note_use_case.dart';
import 'package:note_app/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../domain/repositories/note_repository.dart';

part 'service_locator.g.dart';

@riverpod
Future<Box<NoteEntity>> noteBox(NoteBoxRef ref) async =>
    await Hive.openBox<NoteEntity>(kNoteBox);

@riverpod
Future<LocalNoteSource> localNoteSource(LocalNoteSourceRef ref) async =>
    LocalNoteSourceImpl(
      noteBox: await ref.watch(noteBoxProvider.future),
    );

@riverpod
Future<NoteRepository> noteRepository(NoteRepositoryRef ref) async =>
    NoteRepositoryImpl(
      localNoteSource: await ref.watch(localNoteSourceProvider.future),
    );

@riverpod
Future<NoteUseCase> noteUseCase(NoteUseCaseRef ref) async => NoteInteractor(
      noteRepository: await ref.watch(noteRepositoryProvider.future),
    );
