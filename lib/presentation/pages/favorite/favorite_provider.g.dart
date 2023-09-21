// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

part of 'favorite_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteNotesHash() => r'e953ce8fc5d9855763ec5bec6edfeefd2261992d';

/// See also [favoriteNotes].
@ProviderFor(favoriteNotes)
final favoriteNotesProvider =
    AutoDisposeStreamProvider<List<FavoriteNote>>.internal(
  favoriteNotes,
  name: r'favoriteNotesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$favoriteNotesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FavoriteNotesRef = AutoDisposeStreamProviderRef<List<FavoriteNote>>;
String _$swipeNoteHash() => r'9f041797b81396a026676b3a01d502a9af1b109c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [swipeNote].
@ProviderFor(swipeNote)
const swipeNoteProvider = SwipeNoteFamily();

/// See also [swipeNote].
class SwipeNoteFamily extends Family<AsyncValue<void>> {
  /// See also [swipeNote].
  const SwipeNoteFamily();

  /// See also [swipeNote].
  SwipeNoteProvider call({
    required FavoriteNote favoriteNote,
  }) {
    return SwipeNoteProvider(
      favoriteNote: favoriteNote,
    );
  }

  @override
  SwipeNoteProvider getProviderOverride(
    covariant SwipeNoteProvider provider,
  ) {
    return call(
      favoriteNote: provider.favoriteNote,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'swipeNoteProvider';
}

/// See also [swipeNote].
class SwipeNoteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [swipeNote].
  SwipeNoteProvider({
    required FavoriteNote favoriteNote,
  }) : this._internal(
          (ref) => swipeNote(
            ref as SwipeNoteRef,
            favoriteNote: favoriteNote,
          ),
          from: swipeNoteProvider,
          name: r'swipeNoteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$swipeNoteHash,
          dependencies: SwipeNoteFamily._dependencies,
          allTransitiveDependencies: SwipeNoteFamily._allTransitiveDependencies,
          favoriteNote: favoriteNote,
        );

  SwipeNoteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.favoriteNote,
  }) : super.internal();

  final FavoriteNote favoriteNote;

  @override
  Override overrideWith(
    FutureOr<void> Function(SwipeNoteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SwipeNoteProvider._internal(
        (ref) => create(ref as SwipeNoteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        favoriteNote: favoriteNote,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SwipeNoteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SwipeNoteProvider && other.favoriteNote == favoriteNote;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, favoriteNote.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SwipeNoteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `favoriteNote` of this provider.
  FavoriteNote get favoriteNote;
}

class _SwipeNoteProviderElement extends AutoDisposeFutureProviderElement<void>
    with SwipeNoteRef {
  _SwipeNoteProviderElement(super.provider);

  @override
  FavoriteNote get favoriteNote => (origin as SwipeNoteProvider).favoriteNote;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
