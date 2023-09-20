import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:note_app/data/sources/locals/databases/note_entity.dart';
import 'package:note_app/domain/models/favorite_note.dart';
import 'package:note_app/domain/models/note_detail.dart';
import '../domain/models/added_note.dart';

extension StringUtils on String {
  bool get isBlank => trim().isEmpty;
}

extension NoteDetailAdapter on NoteDetail {
  NoteEntity get asNoteEntity => NoteEntity(
        title: title,
        body: body,
        lastUpdatedAt: DateTime.now(),
        isFavorite: isFavorite,
      );
}

extension NoteEntityAdapter on NoteEntity {
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
            DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(lastUpdatedAt),
        isFavorite: isFavorite,
      );

  NoteDetail get asNoteDetail =>
      NoteDetail(id: key, title: title, body: body, isFavorite: isFavorite);
}

extension FavoriteNoteAdapter on FavoriteNote {
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
