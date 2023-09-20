enum NavDestination {
  home(path: '/notes'),
  detail(path: ':id'),
  favorite(path: '/favorites'),
  write(path: 'write/:');

  const NavDestination({required this.path});

  final String path;
}