import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/navigation/nav_destination.dart';
import 'package:note_app/presentation/navigation/navigation_provider.dart';
import 'package:note_app/utils/extensions.dart';
import '../navigation/navigation_item.dart';

final class AdaptiveNavigation extends ConsumerStatefulWidget {
  const AdaptiveNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<AdaptiveNavigation> createState() => _AdaptiveNavigationState();
}

final class _AdaptiveNavigationState extends ConsumerState<AdaptiveNavigation> {
  // need to use [CupertinoTabController+UniqueKey] to avoid bug
  // "multiple widgets used the same GlobalKey"
  // when use go_router and CupertinoTab
  late final CupertinoTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = CupertinoTabController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onNavTapped(int index, BuildContext context) {
    final navigationActions = {
      0: () => GoRouter.of(context).go(NavDestination.home.path),
      1: () => GoRouter.of(context).go(NavDestination.favorite.path),
    };
    navigationActions[index]?.call();
  }

  int _getIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location = route.location;
    if (location.startsWith(NavDestination.favorite.path)) return 1;
    return 0;
  }

  Widget _buildBottomBarScaffold({
    required BuildContext context,
    required bool shouldShowNavBar,
    VoidCallback? onFabPressed,
  }) =>
      Scaffold(
        body: widget.child,
        floatingActionButton: _getIndex(context) == 0
            ? FloatingActionButton(
                onPressed: onFabPressed,
                tooltip: 'Write',
                child: const Icon(Icons.edit),
              )
            : null,
        bottomNavigationBar: shouldShowNavBar
            ? NavigationBar(
                selectedIndex: _getIndex(context),
                onDestinationSelected: (index) => _onNavTapped(index, context),
                destinations: materialNavigationItems
                    .map(
                      (navigationItem) => NavigationDestination(
                        icon: Icon(navigationItem.icon),
                        selectedIcon: Icon(navigationItem.selectedIcon),
                        label: navigationItem.label,
                        tooltip: navigationItem.label,
                      ),
                    )
                    .toList(),
              )
            : null,
      );

  Widget _buildCupertinoTabBar({
    required BuildContext context,
    required bool shouldShowNavBar,
  }) =>
      shouldShowNavBar
          ? CupertinoTabScaffold(
              key: UniqueKey(),
              controller: _tabController..index = _getIndex(context),
              tabBar: CupertinoTabBar(
                onTap: (index) => _onNavTapped(index, context),
                items: cupertinoNavigationItems
                    .map(
                      (navigationItem) => BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Icon(navigationItem.icon),
                        ),
                        tooltip: navigationItem.label,
                        activeIcon: Padding(
                          padding: const EdgeInsets.only(top: 6.0),
                          child: Icon(navigationItem.selectedIcon),
                        ),
                      ),
                    )
                    .toList(),
              ),
              tabBuilder: (BuildContext context, int index) => widget.child,
            )
          : CupertinoPageScaffold(
              child: widget.child,
            );

  Widget _buildNavigationRailScaffold({
    required BuildContext context,
    required bool shouldShowNavBar,
    VoidCallback? onFabPressed,
  }) =>
      Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            children: [
              if (shouldShowNavBar)
                NavigationRail(
                  extended: false,
                  leading: FloatingActionButton.small(
                    onPressed: onFabPressed,
                    tooltip: 'Write',
                    child: const Icon(Icons.edit),
                  ),
                  selectedIndex: _getIndex(context),
                  onDestinationSelected: (index) =>
                      _onNavTapped(index, context),
                  destinations: materialNavigationItems
                      .map(
                        (navigationItem) => NavigationRailDestination(
                          icon: Icon(navigationItem.icon),
                          selectedIcon: Icon(navigationItem.selectedIcon),
                          label: Text(
                            navigationItem.label,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      )
                      .toList(),
                ),
              if (shouldShowNavBar)
                const VerticalDivider(thickness: 1, width: 1),
              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final shouldShowNavBar = ref.watch(navBarProvider);
    final navBarNotifier = ref.watch(navBarProvider.notifier);

    final scaffold = switch (Theme.of(context).platform) {
      TargetPlatform.iOS => _buildCupertinoTabBar(
          context: context,
          shouldShowNavBar: shouldShowNavBar,
        ),
      TargetPlatform.android => _buildBottomBarScaffold(
          context: context,
          shouldShowNavBar: shouldShowNavBar,
          onFabPressed: () {
            navBarNotifier.state = false;
            context.go(
              '${NavDestination.home.path}/${NavDestination.write.path}',
            );
          },
        ),
      _ => _buildNavigationRailScaffold(
          context: context,
          onFabPressed: () {
            navBarNotifier.state = false;
            context.go(
              '${NavDestination.home.path}/${NavDestination.write.path}',
            );
          },
          shouldShowNavBar: shouldShowNavBar,
        )
    };

    return scaffold;
  }
}
