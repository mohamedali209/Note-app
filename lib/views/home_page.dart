import 'package:flutter/material.dart';
import 'package:notesapp/widgets/customappbar.dart';
import 'package:notesapp/widgets/modalbottom.dart';
import 'package:notesapp/widgets/notesListview.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
 @override
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const modalbottom();
            },
          );
        },
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.black,
      body: const Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
            customappbar(icon: Icons.delete, namebar: 'Notes'),
            noteslistview()
          ],
        ),
      ),
    );
  }
}
