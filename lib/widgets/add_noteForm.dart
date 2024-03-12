import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_notes_cubit.dart';
import 'package:notesapp/cubits/add_notes_state.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/colorsItem.dart';
import 'package:notesapp/widgets/textfield.dart';

class modalbuttomwidget extends StatefulWidget {
  const modalbuttomwidget({
    super.key,
  });

  @override
  State<modalbuttomwidget> createState() => _modalbuttomwidgetState();
}

GlobalKey<FormState> formkey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? title, subtitle;
bool isloading = false;

class _modalbuttomwidgetState extends State<modalbuttomwidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(11.0),
              child: textfield(
                  onsaved: (p0) {
                    title = p0;
                  },
                  title: 'title'),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: textfield(
                onsaved: (p0) {
                  subtitle = p0;
                },
                title: 'content',
                maxline: 8,
              ),
            ),
          const  ColorsListview(),
            BlocBuilder<AddNotesCubit, AddNotesState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      var notemodel = Notemodel(
                          title: title!,
                          subtitle: subtitle!,
                          date: DateTime.now().toString(),
                          color: Colors.amber.value);
                      BlocProvider.of<AddNotesCubit>(context)
                          .Addnote(notemodel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                        child: isloading
                            ? CircularProgressIndicator()
                            : const Text(
                                'Add',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              )),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

