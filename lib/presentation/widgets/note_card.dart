import 'package:flutter/material.dart';
import 'package:note_app/domain/models/added_note.dart';
import 'package:note_app/utils/extensions.dart';
import '../styles/material_shapes.dart';

final class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
  });

  final AddedNote note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kMedium)),
        color: Theme.of(context).adaptiveCardColor(context),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(kMedium),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    note.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).adaptiveOnSurface(context),
                        ),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  note.lastUpdatedAt,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).adaptiveOnSurface(context),
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      );
}
