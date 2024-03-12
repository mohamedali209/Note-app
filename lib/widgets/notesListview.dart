import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes.dart';
import 'package:notesapp/cubits/notes_state.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/notesItem.dart';

class noteslistview extends StatefulWidget {
  const noteslistview({
    super.key,
  });

  @override
  State<noteslistview> createState() => _noteslistviewState();
}

class _noteslistviewState extends State<noteslistview> {
 @override
  void initState() {
    BlocProvider.of<Notescubit>(context).fetchallnotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Notescubit, Notesstate>(
      builder: (context, state) {
        List<Notemodel> notes = BlocProvider.of<Notescubit>(context).notes??[];
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return  Padding(
                padding:const EdgeInsets.only(bottom: 10),
                child: notescontainer(
                  notes: notes[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
