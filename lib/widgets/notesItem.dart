import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notes.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/editpage.dart';

class notescontainer extends StatelessWidget {
  const notescontainer({
    super.key,
    required this.notes,
  });
  final Notemodel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return  editpage(note: notes,);
          },
        ));
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: 380,
        child: Column(
          children: [
            ListTile(
              title: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Text(
                  notes.title,
                  style: const TextStyle(fontSize: 35),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  notes.subtitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 18),
                ),
              ),
              trailing: IconButton(
                  onPressed: () {
                    notes.delete();
                    BlocProvider.of<Notescubit>(context).fetchallnotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 170, top: 40),
              child: Text(notes.date),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
