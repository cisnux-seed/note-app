import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:note_app/data/sources/locals/databases/note_entity.dart';
import 'package:note_app/domain/models/favorite_note.dart';
import 'package:note_app/domain/models/note_detail.dart';
import 'package:note_app/presentation/styles/color_schemes.dart';
import '../domain/models/added_note.dart';

extension StringExtension on String {
  bool get isBlank => trim().isEmpty;
}

extension NoteDetailExtension on NoteDetail {
  NoteEntity get asNoteEntity => NoteEntity(
        title: title,
        body: body,
        lastUpdatedAt: DateTime.now(),
        isFavorite: isFavorite,
      );
}

extension NoteEntityExtension on NoteEntity {
  AddedNote get asAddedNote => AddedNote(
        id: key,
        title: title,
        lastUpdatedAt: DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY)
            .format(lastUpdatedAt),
      );

  FavoriteNote get asFavoriteNote => FavoriteNote(
        id: key,
        title: title,
        body: body,
        lastUpdatedAt:
            DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(lastUpdatedAt),
        isFavorite: isFavorite,
      );

  NoteDetail get asNoteDetail =>
      NoteDetail(id: key, title: title, body: body, isFavorite: isFavorite);
}

extension FavoriteNoteExtension on FavoriteNote {
  NoteDetail get asNoteDetail => NoteDetail(
        id: id,
        title: title,
        body: body,
        isFavorite: isFavorite,
      );
}

extension GoRouterExtension on GoRouter {
  String get location {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();
    return location;
  }
}

extension ThemeDataExtension on ThemeData {
  Color? adaptiveOnSurfaceVariant(BuildContext context) => switch (platform) {
        TargetPlatform.iOS =>
          CupertinoTheme.brightnessOf(context) == Brightness.dark
              ? kDarkColorScheme.onSurfaceVariant
              : kLightColorScheme.onSurfaceVariant,
        _ => Theme.of(context).colorScheme.onSurfaceVariant
      };

  Color? adaptiveOnSurface(BuildContext context) => switch (platform) {
        TargetPlatform.iOS =>
          CupertinoTheme.brightnessOf(context) == Brightness.dark
              ? CupertinoColors.white
              : CupertinoColors.black,
        _ => Theme.of(context).colorScheme.onSurface
      };

  Color? adaptiveCardColor(BuildContext context) => switch (platform) {
        TargetPlatform.iOS => CupertinoTheme.of(context).barBackgroundColor,
        _ => null
      };

  Color? adaptiveBackgroundColor(BuildContext context) => switch (platform) {
        TargetPlatform.iOS =>
          CupertinoTheme.of(context).barBackgroundColor.withOpacity(1.0),
        _ => null
      };

  IconData? adaptiveBackButtonIcon(BuildContext context) => switch (platform) {
        TargetPlatform.iOS => CupertinoIcons.back,
        _ => Icons.arrow_back,
      };

  Widget adaptiveCircularProgress(BuildContext context) => switch (platform) {
        TargetPlatform.iOS => const CupertinoActivityIndicator(),
        _ => const CircularProgressIndicator(),
      };
}
