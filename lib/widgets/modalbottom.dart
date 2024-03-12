import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/cubits/add_notes_cubit.dart';
import 'package:notesapp/cubits/add_notes_state.dart';
import 'package:notesapp/cubits/notes.dart';
import 'package:notesapp/widgets/add_noteForm.dart';

class modalbottom extends StatelessWidget {
  const modalbottom({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesfailure) {
            print('failed ${state.errormessg}');
          }
          if (state is AddNotesSuccess) {
            BlocProvider.of<Notescubit>(context).fetchallnotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
              inAsyncCall: false,
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(child: modalbuttomwidget()),
              ));
        },
      ),
    );
  }
}
