abstract class AddNotesState {}

class AddNotesInit extends AddNotesState {}

class AddNotesloading extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {}

class AddNotesfailure extends AddNotesState {
  final String errormessg;

   AddNotesfailure({required this.errormessg});
}
