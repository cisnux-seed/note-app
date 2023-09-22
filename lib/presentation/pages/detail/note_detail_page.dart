import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/utils/extensions.dart';
import '../../navigation/navigation_provider.dart';
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
  late var _isAlreadySave = false;

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
            !_titleFocusNode.hasFocus,
      );
    _bodyFocusNode = FocusNode()
      ..addListener(
        () => ref.watch(readModeProvider.notifier).state =
            !_bodyFocusNode.hasFocus,
      );
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
    // to avoid double save in iOS
    if (_isAlreadySave) {
      super.deactivate();
      return;
    }
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
    _isAlreadySave = true;
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
    final favoriteNoteNotifier = ref.watch(favoriteNoteProvider.notifier);
    final navBarNotifier = ref.watch(navBarProvider.notifier);
    final isReadModeActive = ref.watch(readModeProvider);
    final isFavoriteNote = ref.watch(favoriteNoteProvider);

    return Theme.of(context).platform == TargetPlatform.iOS
        ? _buildCupertinoScaffold(context, readModeNotifier, navBarNotifier,
            favoriteNoteNotifier, isReadModeActive, isFavoriteNote)
        : _buildMaterialScaffold(context, readModeNotifier, navBarNotifier,
            favoriteNoteNotifier, isReadModeActive, isFavoriteNote);
  }

  Widget _buildMaterialScaffold(
    BuildContext context,
    StateController<bool> readModeNotifier,
    StateController<bool> navBarNotifier,
    StateController<bool> favoriteNoteNotifier,
    bool isReadModeActive,
    bool isFavoriteNote,
  ) =>
      Scaffold(
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
              CupertinoIcons.back,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              navBarNotifier.state = true;
              context.pop();
            },
          ),
          actions: [
            if (Theme.of(context).platform == TargetPlatform.android)
              IconButton(
                tooltip: !isReadModeActive ? 'Read' : 'Edit',
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
                tooltip: !isFavoriteNote ? 'Like' : 'Dislike',
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
                ? IconButton(
                    tooltip: 'Remove',
                    onPressed: () {
                      // set all text controllers to blank or empty
                      // then dispose method will be called
                      _titleEditingController.text = '';
                      _bodyEditingController.text = '';
                      navBarNotifier.state = true;
                      context.pop();
                    },
                    icon: Icon(
                      Icons.remove_circle_rounded,
                      color: Theme.of(context).colorScheme.onSurface,
                    ))
                : const SizedBox(width: 16.0),
            const SizedBox(
              width: 8.0,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
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
      );

  Widget _buildCupertinoScaffold(
    BuildContext context,
    StateController<bool> readModeNotifier,
    StateController<bool> navBarNotifier,
    StateController<bool> favoriteNoteNotifier,
    bool isReadModeActive,
    bool isFavoriteNote,
  ) =>
      CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          padding: const EdgeInsetsDirectional.only(start: 0.0, end: 8.0),
          leading: CupertinoNavigationBarBackButton(
            onPressed: () {
              navBarNotifier.state = true;
              context.pop();
            },
          ),
          middle: CupertinoTextField.borderless(
            focusNode: _titleFocusNode,
            controller: _titleEditingController,
            placeholder: 'Title',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).adaptiveOnSurface(context),
                ),
            placeholderStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).adaptiveOnSurfaceVariant(context),
                ),
            maxLines: 1,
          ),
          trailing: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Tooltip(
                message: !isReadModeActive ? 'Read' : 'Edit',
                child: CupertinoButton(
                  padding: const EdgeInsets.only(top: 9.0),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    !isReadModeActive
                        ? CupertinoIcons.book
                        : CupertinoIcons.pen,
                  ),
                  onPressed: () {
                    if (!readModeNotifier.state) {
                      _titleFocusNode.unfocus();
                      _bodyFocusNode.unfocus();
                    } else {
                      _titleFocusNode.requestFocus();
                    }
                    readModeNotifier.state = !readModeNotifier.state;
                  },
                ),
              ),
              if (_isModifyModeActive)
                Tooltip(
                  message: !isFavoriteNote ? 'Like' : 'Dislike',
                  child: CupertinoButton(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: !isFavoriteNote
                        ? const Icon(
                            CupertinoIcons.star,
                          )
                        : const Icon(
                            CupertinoIcons.star_fill,
                            color: CupertinoColors.systemYellow,
                          ),
                    onPressed: () => favoriteNoteNotifier.state =
                        !favoriteNoteNotifier.state,
                  ),
                ),
              if (_isModifyModeActive)
                Tooltip(
                  message: 'Remove',
                  child: CupertinoButton(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    onPressed: () {
                      // set all text controllers to blank or empty
                      // then dispose method will be called
                      _titleEditingController.text = '';
                      _bodyEditingController.text = '';
                      navBarNotifier.state = true;
                      context.pop();
                    },
                    child: const Icon(
                      CupertinoIcons.delete,
                    ),
                  ),
                ),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: SizedBox(
              child: CupertinoTextField.borderless(
                focusNode: _bodyFocusNode,
                controller: _bodyEditingController,
                maxLines: null,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).adaptiveOnSurface(context),
                    ),
                placeholderStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                      color:
                          Theme.of(context).adaptiveOnSurfaceVariant(context),
                    ),
                placeholder: 'Write something ....',
              ),
            ),
          ),
        ),
      );
}
