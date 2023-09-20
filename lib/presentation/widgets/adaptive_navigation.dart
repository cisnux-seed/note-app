import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/navigation/nav_destination.dart';
import 'package:note_app/utils/extensions.dart';
import '../navigation/navigation_item.dart';

final class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.child,
  });

  final Widget child;

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

  @override
  Widget build(BuildContext context) => Scaffold(
        body: child,
        key: key,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _getIndex(context),
          onDestinationSelected: (index) => _onNavTapped(index, context),
          destinations: navigationItems
              .map(
                (navigationItem) => NavigationDestination(
                  icon: Icon(navigationItem.icon),
                  selectedIcon: Icon(navigationItem.selectedIcon),
                  label: navigationItem.label,
                  tooltip: navigationItem.label,
                ),
              )
              .toList(),
        ),
      );
}
