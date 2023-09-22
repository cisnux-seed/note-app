import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/pages/favorite/favorite_provider.dart';
import 'package:note_app/presentation/widgets/favorite_card.dart';
import 'package:note_app/utils/constants.dart';
import 'package:note_app/utils/extensions.dart';
import '../../../domain/models/favorite_note.dart';
import '../../navigation/nav_destination.dart';
import '../../navigation/navigation_provider.dart';

final class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteNoteState = ref.watch(favoriteNotesProvider);
    final navBarNotifier = ref.watch(navBarProvider.notifier);

    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(
                'Favorites',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).adaptiveOnSurface(context),
                    ),
              ),
            ),
            child: SafeArea(
              child: _buildAdaptiveBody(
                context,
                favoriteNoteState,
                navBarNotifier,
                onDismissed: (_, favoriteNote) => ref.read(
                  swipeNoteProvider(
                    favoriteNote: favoriteNote.copyWith(isFavorite: false),
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(
                'Favorites',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).adaptiveOnSurface(context),
                    ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: _buildAdaptiveBody(
                context,
                favoriteNoteState,
                navBarNotifier,
                onDismissed: (_, favoriteNote) {
                  ref.read(
                    swipeNoteProvider(
                      favoriteNote: favoriteNote.copyWith(isFavorite: false),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor:
                          Theme.of(context).colorScheme.inverseSurface,
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () => ref.read(
                          swipeNoteProvider(
                            favoriteNote:
                                favoriteNote.copyWith(isFavorite: true),
                          ),
                        ),
                      ),
                      content: Text(
                        'Successfully removed ${favoriteNote.title} from the favorites',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }

  Widget _buildAdaptiveBody(
    BuildContext context,
    AsyncValue<List<FavoriteNote>> favoriteNoteState,
    StateController<bool> navBarNotifier, {
    required void Function(DismissDirection direction, FavoriteNote note)
        onDismissed,
  }) =>
      favoriteNoteState.whenOrNull(
        data: (favoriteNotes) => favoriteNotes.isEmpty
            ? SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      height: 150.0,
                      width: 150.0,
                      image: AssetImage(kEmptyFavorites),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 200.0,
                      child: Text(
                        '❤️ Add your favorite notes.\nHappy writing! 🌟',
                        textAlign: TextAlign.center,
                        style:
                        Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context)
                              .adaptiveOnSurface(context),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                  bottom: 0.0,
                ),
                child: ListView.separated(
                  // swipe to remove from the favorites
                  itemBuilder: (context, index) => FavoriteCard(
                    title: favoriteNotes[index].title,
                    body: favoriteNotes[index].body,
                    dismissibleKey: ObjectKey(favoriteNotes[index]),
                    favoriteNote: favoriteNotes[index],
                    onTap: () {
                      navBarNotifier.state = false;
                      context.go(
                        '${NavDestination.favorite.path}/${favoriteNotes[index].id}',
                      );
                    },
                    onDismissed: (direction) =>
                        onDismissed(direction, favoriteNotes[index]),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: favoriteNotes.length,
                ),
              ),
      ) ??
      Center(
        child: Theme.of(context).adaptiveCircularProgress(context),
      );
}
