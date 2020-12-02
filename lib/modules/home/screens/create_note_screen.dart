import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notely/modules/home/blocs/note_bloc/notes_bloc.dart';
import 'package:notely/modules/home/models/note_model.dart';
import 'package:notely/modules/home/widgets/appbar_button.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController titleController, descriptionController;

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<NotesBloc>(context);
    return Form(
      key: key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: BlocListener<NotesBloc, NotesState>(
        cubit: bloc,
        listener: (context, listenState) async {
          if (listenState is NoteSaved) {
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Note Saved!"),
                    content: Text("This note has been saved successfully!"),
                  );
                });
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<NotesBloc, NotesState>(
            cubit: bloc,
            builder: (context, state) {
              return Stack(
                children: [
                  if (state is NoteLoading)
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black26,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  Scaffold(
                    appBar: AppBar(
                      leadingWidth: 74,
                      leading: Row(
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          AppBarButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        AppBarButton(
                          onPressed: () {
                            if (key.currentState.validate()) {
                              print("Validated");
                              NoteModel note = NoteModel(
                                title: titleController.value.text,
                                description: descriptionController.value.text,
                                createdat: DateTime.now(),
                                id: Random().nextInt(100000000),
                              );
                              bloc.add(NoteAdd(note));
                              print(note.toString());
                            } else {
                              print("Invalid data");
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    body: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty)
                                return "This field can't be empty!";
                              else
                                return null;
                            },
                            controller: titleController,
                            style:
                                Theme.of(context).textTheme.headline3.copyWith(
                                      color: Colors.white,
                                    ),
                            maxLines: null,
                            maxLength: 36,
                            maxLengthEnforced: true,
                            buildCounter: (context,
                                {currentLength, isFocused, maxLength}) {
                              return Text("$currentLength / $maxLength",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ));
                            },
                            decoration: InputDecoration.collapsed(
                              hintText: 'Title',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(
                                    color: Colors.white38,
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty)
                                return "This field can't be empty!";
                              else
                                return null;
                            },
                            controller: descriptionController,
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white,
                                    ),
                            maxLines: null,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Type something...',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Colors.white38,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
