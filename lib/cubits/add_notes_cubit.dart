import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/cubits/add_notes_state.dart';
import 'package:notesapp/models/note_model.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInit());
  Color color = Colors.amber;
  Addnote(Notemodel note) async {
    note.color = color.value;
    emit(AddNotesloading());
    try {
      var notessbox = Hive.box<Notemodel>('notes box');
      await notessbox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesfailure(errormessg: e.toString()));
    }
  }
}
