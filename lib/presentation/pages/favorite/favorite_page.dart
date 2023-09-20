import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/pages/favorite/favorite_provider.dart';
import 'package:note_app/utils/constants.dart';
import '../../navigation/nav_destination.dart';

final class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteNoteState = ref.watch(favoriteNotesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Notes',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: 0.0,
          ),
          child: favoriteNoteState.whenOrNull(
                data: (favoriteNotes) => favoriteNotes.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              height: 150.0,
                              width: 150.0,
                              image: AssetImage(kEmptyFavorites),
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            SizedBox(
                              width: 200.0,
                              child: Text(
                                '❤️ Add your favorite notes.\nHappy writing! 🌟',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                    ),
                              ),
                            )
                          ],
                        ),
                      )
                    : ListView.separated(
                        // swipe to remove from the favorites
                        itemBuilder: (context, index) => Dismissible(
                          key: ObjectKey(favoriteNotes[index]),
                          onDismissed: (_) {
                            ref.read(
                              swipeNoteProvider(
                                favoriteNote: favoriteNotes[index]
                                    .copyWith(isFavorite: false),
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                                action: SnackBarAction(
                                  label: 'Undo',
                                  textColor: Theme.of(context).colorScheme.inversePrimary,
                                  onPressed: () => ref.read(
                                    swipeNoteProvider(
                                      favoriteNote: favoriteNotes[index]
                                          .copyWith(isFavorite: true),
                                    ),
                                  ),
                                ),
                                content: Text(
                                  'Successfully removed ${favoriteNotes[index].title} from the favorites',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onInverseSurface,
                                      ),
                                ),
                              ),
                            );
                          },
                          background: Container(
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                          child: ListTile(
                            key: ObjectKey(favoriteNotes[index]),
                            onTap: () => context.go(
                              '${NavDestination.favorite.path}/${favoriteNotes[index].id}',
                            ),
                            tileColor: Theme.of(context).colorScheme.surface,
                            title: Text(
                              favoriteNotes[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface,
                                  ),
                            ),
                            subtitle: Text(
                              favoriteNotes[index].title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(
                              favoriteNotes[index].lastUpdatedAt,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: favoriteNotes.length,
                      ),
              ) ??
              const Center(
                child: CircularProgressIndicator(),
              ),
        ),
      ),
    );
  }
}
