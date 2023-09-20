// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

part of 'note_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noteDetailHash() => r'5c59dd909e14425c8d5da219d06cb779a82824fa';

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

/// See also [noteDetail].
@ProviderFor(noteDetail)
const noteDetailProvider = NoteDetailFamily();

/// See also [noteDetail].
class NoteDetailFamily extends Family<AsyncValue<NoteDetail?>> {
  /// See also [noteDetail].
  const NoteDetailFamily();

  /// See also [noteDetail].
  NoteDetailProvider call({
    required dynamic id,
  }) {
    return NoteDetailProvider(
      id: id,
    );
  }

  @override
  NoteDetailProvider getProviderOverride(
    covariant NoteDetailProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'noteDetailProvider';
}

/// See also [noteDetail].
class NoteDetailProvider extends AutoDisposeFutureProvider<NoteDetail?> {
  /// See also [noteDetail].
  NoteDetailProvider({
    required dynamic id,
  }) : this._internal(
          (ref) => noteDetail(
            ref as NoteDetailRef,
            id: id,
          ),
          from: noteDetailProvider,
          name: r'noteDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$noteDetailHash,
          dependencies: NoteDetailFamily._dependencies,
          allTransitiveDependencies:
              NoteDetailFamily._allTransitiveDependencies,
          id: id,
        );

  NoteDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final dynamic id;

  @override
  Override overrideWith(
    FutureOr<NoteDetail?> Function(NoteDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NoteDetailProvider._internal(
        (ref) => create(ref as NoteDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<NoteDetail?> createElement() {
    return _NoteDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoteDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin NoteDetailRef on AutoDisposeFutureProviderRef<NoteDetail?> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _NoteDetailProviderElement
    extends AutoDisposeFutureProviderElement<NoteDetail?> with NoteDetailRef {
  _NoteDetailProviderElement(super.provider);

  @override
  dynamic get id => (origin as NoteDetailProvider).id;
}

String _$upsertHash() => r'bd98ffaf17ad824095f4c57333159a59007de4ad';

/// See also [upsert].
@ProviderFor(upsert)
const upsertProvider = UpsertFamily();

/// See also [upsert].
class UpsertFamily extends Family<AsyncValue<void>> {
  /// See also [upsert].
  const UpsertFamily();

  /// See also [upsert].
  UpsertProvider call({
    required dynamic id,
    required String title,
    required String body,
    required bool isFavorite,
  }) {
    return UpsertProvider(
      id: id,
      title: title,
      body: body,
      isFavorite: isFavorite,
    );
  }

  @override
  UpsertProvider getProviderOverride(
    covariant UpsertProvider provider,
  ) {
    return call(
      id: provider.id,
      title: provider.title,
      body: provider.body,
      isFavorite: provider.isFavorite,
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
  String? get name => r'upsertProvider';
}

/// See also [upsert].
class UpsertProvider extends AutoDisposeFutureProvider<void> {
  /// See also [upsert].
  UpsertProvider({
    required dynamic id,
    required String title,
    required String body,
    required bool isFavorite,
  }) : this._internal(
          (ref) => upsert(
            ref as UpsertRef,
            id: id,
            title: title,
            body: body,
            isFavorite: isFavorite,
          ),
          from: upsertProvider,
          name: r'upsertProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$upsertHash,
          dependencies: UpsertFamily._dependencies,
          allTransitiveDependencies: UpsertFamily._allTransitiveDependencies,
          id: id,
          title: title,
          body: body,
          isFavorite: isFavorite,
        );

  UpsertProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.title,
    required this.body,
    required this.isFavorite,
  }) : super.internal();

  final dynamic id;
  final String title;
  final String body;
  final bool isFavorite;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpsertRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpsertProvider._internal(
        (ref) => create(ref as UpsertRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        title: title,
        body: body,
        isFavorite: isFavorite,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpsertProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpsertProvider &&
        other.id == id &&
        other.title == title &&
        other.body == body &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);
    hash = _SystemHash.combine(hash, isFavorite.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpsertRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  dynamic get id;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `body` of this provider.
  String get body;

  /// The parameter `isFavorite` of this provider.
  bool get isFavorite;
}

class _UpsertProviderElement extends AutoDisposeFutureProviderElement<void>
    with UpsertRef {
  _UpsertProviderElement(super.provider);

  @override
  dynamic get id => (origin as UpsertProvider).id;
  @override
  String get title => (origin as UpsertProvider).title;
  @override
  String get body => (origin as UpsertProvider).body;
  @override
  bool get isFavorite => (origin as UpsertProvider).isFavorite;
}

String _$deleteHash() => r'24c6b7e7b205cbc29c1b6e43e4a94bdec9809d3a';

/// See also [delete].
@ProviderFor(delete)
const deleteProvider = DeleteFamily();

/// See also [delete].
class DeleteFamily extends Family<AsyncValue<void>> {
  /// See also [delete].
  const DeleteFamily();

  /// See also [delete].
  DeleteProvider call({
    required dynamic id,
  }) {
    return DeleteProvider(
      id: id,
    );
  }

  @override
  DeleteProvider getProviderOverride(
    covariant DeleteProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'deleteProvider';
}

/// See also [delete].
class DeleteProvider extends AutoDisposeFutureProvider<void> {
  /// See also [delete].
  DeleteProvider({
    required dynamic id,
  }) : this._internal(
          (ref) => delete(
            ref as DeleteRef,
            id: id,
          ),
          from: deleteProvider,
          name: r'deleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteHash,
          dependencies: DeleteFamily._dependencies,
          allTransitiveDependencies: DeleteFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final dynamic id;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteProvider._internal(
        (ref) => create(ref as DeleteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  dynamic get id;
}

class _DeleteProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteRef {
  _DeleteProviderElement(super.provider);

  @override
  dynamic get id => (origin as DeleteProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
