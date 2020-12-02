part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class NoteAdd extends NotesEvent {
  final NoteModel note;
  NoteAdd(this.note);
}

class NoteEdit extends NotesEvent {
  final NoteModel note;

  NoteEdit(this.note);
}

class NoteDelete extends NotesEvent {
  final int id;

  NoteDelete(this.id);
}
