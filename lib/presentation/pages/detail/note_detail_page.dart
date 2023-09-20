import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/utils/extensions.dart';
import 'note_detail_provider.dart';

final class NoteDetailPage extends ConsumerStatefulWidget {
  const NoteDetailPage({super.key, this.id});

  final String? id;

  @override
  ConsumerState<NoteDetailPage> createState() => _NoteDetailPageState();
}

final class _NoteDetailPageState extends ConsumerState<NoteDetailPage> {
  late final FocusNode _titleFocusNode;
  late final FocusNode _bodyFocusNode;
  late final TextEditingController _titleEditingController;
  late final TextEditingController _bodyEditingController;
  late final MenuController _menuController;

  String? get _noteId => widget.id;

  bool get _isModifyModeActive => _noteId != null;

  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController();
    _bodyEditingController = TextEditingController();
    _titleFocusNode = FocusNode()
      ..requestFocus()
      ..addListener(
        () => ref.watch(readModeProvider.notifier).state =
            !_titleFocusNode.hasPrimaryFocus,
      );
    _bodyFocusNode = FocusNode()
      ..addListener(
        () => ref.watch(readModeProvider.notifier).state =
            !_bodyFocusNode.hasPrimaryFocus,
      );
    _menuController = MenuController();
    if (_noteId == null) return;
    // initialize title and body
    ref.listenManual(noteDetailProvider(id: _noteId), (_, latestState) {
      latestState.whenData((noteDetail) {
        _titleEditingController
          ..text = noteDetail?.title ?? ''
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: noteDetail?.title.length ?? 0),
          );
        _bodyEditingController
          ..text = noteDetail?.body ?? ''
          ..selection = TextSelection.fromPosition(
            TextPosition(offset: noteDetail?.body.length ?? 0),
          );
        ref.watch(favoriteNoteProvider.notifier).state =
            noteDetail?.isFavorite ?? false;
      });
    });
  }

  @override
  void deactivate() {
    final currentTitle = _titleEditingController.text;
    final currentBody = _bodyEditingController.text;
    final isReadModeActive = ref.read(favoriteNoteProvider);
    if (!currentTitle.isBlank || !currentBody.isBlank) {
      ref.read(upsertProvider(
        id: _noteId,
        title: currentTitle.isBlank ? 'No Title' : currentTitle,
        body: currentBody,
        isFavorite: isReadModeActive,
      ));
    } else if (currentTitle.isBlank && currentBody.isBlank && _noteId != null) {
      ref.read(deleteProvider(id: _noteId));
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _titleFocusNode.dispose();
    _bodyFocusNode.dispose();
    _titleEditingController.dispose();
    _bodyEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final readModeNotifier = ref.watch(readModeProvider.notifier);
    final isReadModeActive = ref.watch(readModeProvider);
    final isFavoriteNote = ref.watch(favoriteNoteProvider);
    final favoriteNoteNotifier = ref.watch(favoriteNoteProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: TextField(
          focusNode: _titleFocusNode,
          controller: _titleEditingController,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onSurface,
              ),
          decoration: InputDecoration(
            hintText: 'Title',
            border: InputBorder.none,
            hintMaxLines: 1,
            hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
          maxLines: 1,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(
              !isReadModeActive
                  ? Icons.chrome_reader_mode_rounded
                  : Icons.edit_rounded,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              if (!readModeNotifier.state) {
                _titleFocusNode.unfocus();
                _bodyFocusNode.unfocus();
              } else {
                _bodyFocusNode.requestFocus();
              }
              readModeNotifier.state = !readModeNotifier.state;
            },
          ),
          if (_isModifyModeActive)
            IconButton(
              icon: !isFavoriteNote
                  ? Icon(
                      Icons.favorite_border_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                    )
                  : const Icon(Icons.favorite_rounded, color: Colors.red),
              onPressed: () =>
                  favoriteNoteNotifier.state = !favoriteNoteNotifier.state,
            ),
          _isModifyModeActive
              ? SubmenuButton(
                  style: SubmenuButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  controller: _menuController,
                  menuChildren: <MenuItemButton>[
                    MenuItemButton(
                      leadingIcon: Icon(
                        Icons.remove_circle_rounded,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      child: Text(
                        'Remove',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                      onPressed: () {
                        // set all text controllers to blank or empty
                        // then dispose method will be called
                        _titleEditingController.text = '';
                        _bodyEditingController.text = '';
                        context.pop();
                      },
                    )
                  ],
                  child: IconButton(
                    icon: Icon(
                      Icons.more_vert_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: () => _menuController.isOpen
                        ? _menuController.close()
                        : _menuController.open(),
                  ),
                  // onClose: () => optionMenuController.state = false,
                )
              : const SizedBox(width: 16.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: TextField(
            focusNode: _bodyFocusNode,
            controller: _bodyEditingController,
            maxLines: null,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Write something ....',
              hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              hintMaxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
