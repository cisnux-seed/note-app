import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/sources/locals/databases/note_entity.dart';
import 'package:note_app/presentation/note_app.dart';

/// note: to get consistent data in Web
/// always use same port
/// e.g. flutter run -d chrome --web-port 5040
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteEntityAdapter());
  usePathUrlStrategy();
  runApp(const ProviderScope(child: NoteApp()));
}
