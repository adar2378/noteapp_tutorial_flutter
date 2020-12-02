import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notely/modules/home/models/note_model.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  var notes = List<NoteModel>.unmodifiable([]);
  NotesBloc() : super(NoteNoData());

  @override
  Stream<NotesState> mapEventToState(
    NotesEvent event,
  ) async* {
    if (event is NoteAdd) {
      notes = List<NoteModel>.unmodifiable([...notes, event.note]);
      yield NoteSaved();
      yield NoteData(notes);
    }
  }
}
