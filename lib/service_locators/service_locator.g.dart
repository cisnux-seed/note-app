// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

part of 'service_locator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteBoxHash() => r'a4ee2f8dbdf7b8fb8017fb5afabe913b05c464db';

/// See also [noteBox].
@ProviderFor(noteBox)
final noteBoxProvider = AutoDisposeFutureProvider<Box<NoteEntity>>.internal(
  noteBox,
  name: r'noteBoxProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$noteBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NoteBoxRef = AutoDisposeFutureProviderRef<Box<NoteEntity>>;
String _$localNoteSourceHash() => r'385e6ff34abe813b2d6a01247e10d2ad84372755';

/// See also [localNoteSource].
@ProviderFor(localNoteSource)
final localNoteSourceProvider =
    AutoDisposeFutureProvider<LocalNoteSource>.internal(
  localNoteSource,
  name: r'localNoteSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$localNoteSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocalNoteSourceRef = AutoDisposeFutureProviderRef<LocalNoteSource>;
String _$noteRepositoryHash() => r'aaba2739164bedb1ab45b3c5d0d0dad4412c6918';

/// See also [noteRepository].
@ProviderFor(noteRepository)
final noteRepositoryProvider =
    AutoDisposeFutureProvider<NoteRepository>.internal(
  noteRepository,
  name: r'noteRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$noteRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NoteRepositoryRef = AutoDisposeFutureProviderRef<NoteRepository>;
String _$noteUseCaseHash() => r'5b8e94ad755033b85003019189233a094b5949ab';

/// See also [noteUseCase].
@ProviderFor(noteUseCase)
final noteUseCaseProvider = AutoDisposeFutureProvider<NoteUseCase>.internal(
  noteUseCase,
  name: r'noteUseCaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$noteUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NoteUseCaseRef = AutoDisposeFutureProviderRef<NoteUseCase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
