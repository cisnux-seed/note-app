import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/data/sources/locals/databases/note_entity.dart';
import 'package:note_app/presentation/note_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteEntityAdapter());
  runApp(const ProviderScope(child: NoteApp()));
}
