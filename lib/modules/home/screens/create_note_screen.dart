import 'package:flutter/material.dart';
import 'package:notely/modules/home/widgets/appbar_button.dart';

class CreateNote extends StatefulWidget {
  @override
  _CreateNoteState createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          AppBarButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "Save",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              style: Theme.of(context).textTheme.headline3.copyWith(
                    color: Colors.white,
                  ),
              maxLines: null,
              maxLength: 36,
              maxLengthEnforced: true,
              buildCounter: (context, {currentLength, isFocused, maxLength}) {
                if (isFocused)
                  return Text("$currentLength / $maxLength",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ));
                else
                  return Container();
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Title',
                hintStyle: Theme.of(context).textTheme.headline3.copyWith(
                      color: Colors.white38,
                    ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.white,
                  ),
              maxLines: null,
              decoration: InputDecoration.collapsed(
                hintText: 'Type something...',
                hintStyle: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white38,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
