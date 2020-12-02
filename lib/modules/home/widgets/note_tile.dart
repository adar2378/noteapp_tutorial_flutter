import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notely/modules/home/models/note_model.dart';

class NoteTile extends StatelessWidget {
  final NoteModel noteModel;

  const NoteTile({Key key, this.noteModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var colors = [
      Colors.pink.shade200,
      Colors.yellow.shade200,
      Colors.blue.shade200,
    ];
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colors[Random().nextInt(3)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            noteModel.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            DateFormat.yMMMMd().format(noteModel.createdat),
          ),
        ],
      ),
    );
  }
}
