import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/domain/models/favorite_note.dart';
import 'package:note_app/utils/extensions.dart';

final class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.favoriteNote,
    required this.dismissibleKey,
    this.onDismissed,
    this.onTap,
    required this.title,
    required this.body,
  });

  final String title;
  final String body;
  final DismissDirectionCallback? onDismissed;
  final GestureTapCallback? onTap;
  final FavoriteNote favoriteNote;
  final ObjectKey dismissibleKey;

  @override
  Widget build(BuildContext context) => Dismissible(
        key: dismissibleKey,
        confirmDismiss: Theme.of(context).platform == TargetPlatform.iOS
            ? (_) async => await showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text('Delete note "$title"'),
                    content:
                        const Text('This will delete the note from favorites'),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () => context.pop(false),
                        child: const Text('Cancel'),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () => context.pop(true),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                )
            : null,
        onDismissed: onDismissed,
        background: Container(
          color: Theme.of(context).colorScheme.surfaceTint,
        ),
        child: Theme.of(context).platform == TargetPlatform.iOS
            ? CupertinoListTile.notched(
                key: ObjectKey(favoriteNote),
                title: Text(
                  title,
                  maxLines: 2,
                ),
                onTap: onTap,
                subtitle: body.isBlank
                    ? null
                    : Text(
                        body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                additionalInfo: Text(
                  favoriteNote.lastUpdatedAt,
                ),
                leading: const Icon(
                  CupertinoIcons.star_fill,
                  color: CupertinoColors.systemYellow,
                ),
              )
            : ListTile(
                key: ObjectKey(favoriteNote),
                onTap: onTap,
                leading: const Icon(Icons.star, color: Colors.amberAccent),
                tileColor: Theme.of(context).colorScheme.surface,
                title: Text(
                  title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                subtitle: body.isBlank
                    ? null
                    : Text(
                        body,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                trailing: Text(
                  favoriteNote.lastUpdatedAt,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              ),
      );
}
