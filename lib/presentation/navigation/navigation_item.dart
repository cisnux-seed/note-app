import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_item.freezed.dart';

@freezed
abstract class NavigationItem with _$NavigationItem {
  const factory NavigationItem({
    required String label,
    required IconData icon,
    required IconData selectedIcon,
  }) = _NavigationItem;
}

final navigationItems = [
  const NavigationItem(
    label: 'Home',
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),
  const NavigationItem(
    label: 'Favorites',
    icon: Icons.favorite_border_rounded,
    selectedIcon: Icons.favorite_rounded,
  ),
];
