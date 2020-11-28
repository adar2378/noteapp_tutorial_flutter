import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notely/modules/home/models/note_model.dart';
import 'package:notely/modules/home/widgets/appbar_button.dart';
import 'package:notely/modules/home/widgets/note_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var notes = <NoteModel>[
    NoteModel(
      title: "Note about tutorial",
      description: "adad ada a babll adad adafggh adad",
      createdat: DateTime.now(),
    ),
    NoteModel(
      title: "ada aggg aadad Note about tutorial",
      description: "adad ada a babll adad adafggh adad",
      createdat: DateTime.now(),
    ),
    NoteModel(
      title: "Note adada  dad",
      description: "adad ada a dad adad adafggh adad",
      createdat: DateTime.now(),
    ),
    NoteModel(
      title: "Note about ada Note about tutorial",
      description: "adad ada a babll adad adafggh adad",
      createdat: DateTime.now(),
    ),
    NoteModel(
      title: "Note ffffadd tutorial",
      description: "adad ada a babll adad adafggh adad",
      createdat: DateTime.now(),
    ),
    NoteModel(
      title: "Note about tutorial",
      description: "adad ada a babll adad adafggh adad",
      createdat: DateTime.now(),
    ),
    NoteModel(
      title: "Note about tutorial",
      description: "adad ada a babll adad adafggh adad",
      createdat: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        actions: [
          AppBarButton(
            child: Icon(
              CupertinoIcons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) => NoteTile(
          noteModel: notes[index],
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
      ),
    );
  }
}
