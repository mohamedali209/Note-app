import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/widgets/customappbar.dart';
import 'package:notesapp/widgets/textfield.dart';

class editpage extends StatefulWidget {
  const editpage({super.key, required this.note});
  final Notemodel note;

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
        child: Column(
          children: [
            customappbar(
              namebar: 'Edit',
              icon: Icons.check,
              onPressed: ()  {
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = content ?? widget.note.subtitle;
                 widget.note.save();
                BlocProvider.of<Notescubit>(context).fetchallnotes();
                Navigator.pop(context);
              },
            ),
            textfield(
              onChanged: (p0) {
                title = p0;
              },
              title: 'title',
            ),
            SizedBox(
              height: 10,
            ),
            textfield(
              onChanged: (p0) {
                content = p0;
              },
              title: 'content',
              maxline: 10,
            )
          ],
        ),
      ),
    );
  }
}
