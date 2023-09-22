import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/domain/models/added_note.dart';
import 'package:note_app/presentation/navigation/navigation_provider.dart';
import 'package:note_app/presentation/widgets/note_card.dart';
import 'package:note_app/utils/extensions.dart';
import '../../../utils/constants.dart';
import '../../navigation/nav_destination.dart';
import 'home_provider.dart';

final class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

final class _HomePageState extends ConsumerState<HomePage> {
  late final SearchController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = SearchController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteState = ref.watch(notesProvider);
    final navBarNotifier = ref.watch(navBarProvider.notifier);
    final searchNotifier = ref.watch(searchProvider.notifier);

    return SafeArea(
      child: Theme.of(context).platform == TargetPlatform.iOS
          ? CupertinoPageScaffold(
              child: _buildAdaptiveBody(
                context,
                noteState,
                navBarNotifier,
                searchNotifier,
              ),
            )
          : Scaffold(
              body: _buildAdaptiveBody(
                context,
                noteState,
                navBarNotifier,
                searchNotifier,
              ),
            ),
    );
  }

  Widget _buildResponsiveSliverGrid(
    AsyncValue<List<AddedNote>> noteState,
    StateController<bool> navBarNotifier,
  ) =>
      SliverLayoutBuilder(
        builder: (context, constraints) {
          final crossAxisExtent = switch (constraints.crossAxisExtent) {
            >= 700 && <= 800 => 4,
            >= 500 && <= 700 => 3,
            >= 0 && <= 500 => 2,
            _ => 5
          };

          return SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisExtent,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => noteState.whenOrNull(
                skipError: true,
                skipLoadingOnRefresh: true,
                skipLoadingOnReload: true,
                data: (notes) => NoteCard(
                  key: ObjectKey(notes[index]),
                  note: notes[index],
                  onTap: () {
                    navBarNotifier.state = false;
                    context.go(
                      '${NavDestination.home.path}/${notes[index].id}',
                    );
                  },
                ),
              ),
              childCount:
                  noteState.whenOrNull(data: (notes) => notes.length) ?? 0,
            ),
          );
        },
      );

  _buildSearchAnchor(StateController<bool> navBarNotifier,
          StateController<String> searchNotifier) =>
      SearchAnchor(
        isFullScreen: false,
        headerTextStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).adaptiveOnSurface(context),
            ),
        viewBackgroundColor: Theme.of(context).adaptiveBackgroundColor(context),
        searchController: _searchController
          ..addListener(
            () => searchNotifier.state = _searchController.text,
          ),
        viewLeading: IconButton(
          icon: Icon(Theme.of(context).adaptiveBackButtonIcon(context)),
          onPressed: () {
            navBarNotifier.state = true;
            context.pop();
          },
        ),
        viewBuilder: (suggestions) => Consumer(
          builder: (_, ref, __) =>
              ref.watch(suggestionsProvider).whenOrNull(
                    data: (suggestions) => ListView.builder(
                      itemCount: suggestions.length,
                      itemBuilder: (_, index) => ListTile(
                        key: UniqueKey(),
                        title: Text(
                          suggestions[index],
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context)
                                        .adaptiveOnSurface(context),
                                  ),
                        ),
                        onTap: () => _searchController.closeView(
                          suggestions[index],
                        ),
                      ),
                    ),
                  ) ??
              const SizedBox(),
        ),
        suggestionsBuilder: (_, __) => [],
        builder: (context, controller) => SearchBar(
          backgroundColor: MaterialStatePropertyAll(
              Theme.of(context).adaptiveBackgroundColor(context)),
          textStyle: MaterialStatePropertyAll<TextStyle?>(
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).adaptiveOnSurface(context),
                ),
          ),
          hintText: 'Search title, content',
          hintStyle: MaterialStatePropertyAll<TextStyle?>(
            Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).adaptiveOnSurfaceVariant(context),
                ),
          ),
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 20.0),
          ),
          onTap: () => controller.openView(),
          onChanged: (_) => controller.openView(),
          leading: const Icon(Icons.search),
          trailing: const [
            CircleAvatar(
              backgroundImage: AssetImage(kProfilePhoto),
            ),
          ],
        ),
      );

  Widget _buildAdaptiveBody(
    BuildContext context,
    AsyncValue<List<AddedNote>> noteState,
    StateController<bool> navBarNotifier,
    StateController<String> searchNotifier,
  ) =>
      Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                  bottom: 0.0,
                ),
                sliver: SliverAppBar(
                  forceMaterialTransparency: true,
                  collapsedHeight: 70.0,
                  floating: true,
                  flexibleSpace:
                      _buildSearchAnchor(navBarNotifier, searchNotifier),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 8.0,
                ),
                sliver: _buildResponsiveSliverGrid(noteState, navBarNotifier),
              ),
            ],
          ),
          Center(
            child: noteState.when(
              data: (notes) => notes.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          height: 200.0,
                          width: 200.0,
                          image: AssetImage(kEmptyNotes),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SizedBox(
                          width: 250.0,
                          child: Text(
                            '🖊️ Create a note and change your world, one word at a time. \nHappy writing! 🌟',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .adaptiveOnSurface(context),
                                ),
                          ),
                        )
                      ],
                    )
                  : null,
              error: (_, __) =>
                  Theme.of(context).adaptiveCircularProgress(context),
              loading: () =>
                  Theme.of(context).adaptiveCircularProgress(context),
            ),
          ),
          if (Theme.of(context).platform == TargetPlatform.iOS)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    navBarNotifier.state = false;
                    context.go(
                      '${NavDestination.home.path}/${NavDestination.write.path}',
                    );
                  },
                  tooltip: 'Write',
                  child: const Icon(Icons.edit),
                ),
              ),
            ),
        ],
      );
}
