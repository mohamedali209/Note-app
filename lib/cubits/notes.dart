import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notesapp/cubits/notes_state.dart';
import 'package:notesapp/models/note_model.dart';

class Notescubit extends Cubit<Notesstate> {
  Notescubit() : super(Notesinit());
  List<Notemodel>? notes;
  fetchallnotes() {
    var notessbox = Hive.box<Notemodel>('notes box');
    notes = notessbox.values.toList();
    emit(Notessucess());
  }
}
