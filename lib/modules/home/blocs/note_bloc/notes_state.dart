part of 'notes_bloc.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class NoteLoading extends NotesState {}

class NoteData extends NotesState {
  final List<NoteModel> notes;

  NoteData(this.notes);
}

class NoteNoData extends NotesState {}

class NoteError extends NotesState {}

class NoteSaved extends NotesState {}

class NoteDeleted extends NotesState {}
