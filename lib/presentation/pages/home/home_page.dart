import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/widgets/mobile_note_item.dart';
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

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context
              .go('${NavDestination.home.path}/${NavDestination.write.path}'),
          tooltip: 'Write',
          child: const Icon(Icons.edit),
        ),
        body: Stack(
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
                    flexibleSpace: SearchAnchor(
                      searchController: _searchController
                        ..addListener(() {
                          ref.watch(searchProvider.notifier).state =
                              _searchController.text;
                        }),
                      isFullScreen: false,
                      viewBuilder: (suggestions) => Consumer(
                        builder: (_, ref, __) =>
                            ref.watch(suggestionsProvider).whenOrNull(
                                  data: (suggestions) => ListView.builder(
                                    itemCount: suggestions.length,
                                    itemBuilder: (_, index) => ListTile(
                                      key: UniqueKey(),
                                      title: Text(
                                        suggestions[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface,
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
                        hintText: 'Search title, content',
                        hintStyle: MaterialStatePropertyAll<TextStyle?>(
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                              ),
                        ),
                        controller: controller,
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 16.0)),
                        onTap: () => controller.openView(),
                        onChanged: (_) => controller.openView(),
                        leading: const Icon(Icons.search),
                        trailing: const [
                          CircleAvatar(
                            backgroundImage: AssetImage(kProfilePhoto),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 8.0,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => noteState.whenOrNull(
                        skipError: true,
                        skipLoadingOnRefresh: true,
                        skipLoadingOnReload: true,
                        data: (notes) => MobileNoteItem(
                          key: ObjectKey(notes[index]),
                          note: notes[index],
                          onTap: () => context.go(
                            '${NavDestination.home.path}/${notes[index].id}',
                          ),
                        ),
                      ),
                      childCount:
                          noteState.whenOrNull(data: (notes) => notes.length) ??
                              0,
                    ),
                  ),
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
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          )
                        ],
                      )
                    : null,
                error: (_, __) => const CircularProgressIndicator(),
                loading: () => const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
