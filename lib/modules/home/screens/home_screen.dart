import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notely/modules/home/blocs/note_bloc/notes_bloc.dart';
import 'package:notely/modules/home/models/note_model.dart';
import 'package:notely/modules/home/screens/create_note_screen.dart';
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
        titleSpacing: 20,
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
      body: BlocBuilder<NotesBloc, NotesState>(
        builder: (context, state) {
          if (state is NoteLoading) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          } else if (state is NoteNoData) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No notes available yet, please add one first!",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          } else if (state is NoteError) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Something went wrong!",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            );
          } else if (state is NoteData) {
            var availableNotes = state.notes;
            return StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: availableNotes.length,
              itemBuilder: (BuildContext context, int index) => NoteTile(
                noteModel: availableNotes[index],
              ),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
              ),
            );
          } else
            return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white24,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateNote(),
              maintainState: true,
            ),
          );
        },
      ),
    );
  }
}
