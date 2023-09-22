import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_app/presentation/widgets/adaptive_navigation.dart';
import 'navigation/nav_destination.dart';
import 'pages/detail/note_detail_page.dart';
import 'pages/favorite/favorite_page.dart';
import 'pages/home/home_page.dart';
import 'styles/text_theme.dart';
import 'styles/color_schemes.dart';

final class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoApp.router(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            title: 'Note App',
            routerConfig: routerConfig,
          )
        : MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Note App',
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: kLightColorScheme,
              textTheme: textTheme,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              colorScheme: kDarkColorScheme,
              textTheme: textTheme,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            routerConfig: routerConfig,
          );
  }

  RouterConfig<Object>? get routerConfig => GoRouter(
        initialLocation: NavDestination.home.path,
        routes: [
          ShellRoute(
            builder: (context, state, child) => AdaptiveNavigation(
              child: child,
            ),
            routes: <RouteBase>[
              GoRoute(
                path: NavDestination.home.path,
                builder: (_, __) => const HomePage(),
                routes: [
                  GoRoute(
                    path: NavDestination.detail.path,
                    pageBuilder: (context, state) => CustomTransitionPage(
                      child: NoteDetailPage(
                        id: state.pathParameters['id'],
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).chain(
                            CurveTween(curve: Curves.easeIn),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ),
                  GoRoute(
                    path: NavDestination.write.path,
                    builder: (_, __) => const NoteDetailPage(),
                  ),
                ],
              ),
              GoRoute(
                path: NavDestination.favorite.path,
                builder: (_, __) => const FavoritePage(),
                routes: [
                  GoRoute(
                    path: NavDestination.detail.path,
                    pageBuilder: (context, state) => CustomTransitionPage(
                      child: NoteDetailPage(
                        id: state.pathParameters['id'],
                      ),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              SlideTransition(
                        position: animation.drive(
                          Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).chain(
                            CurveTween(curve: Curves.easeIn),
                          ),
                        ),
                        child: child,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      );
}
