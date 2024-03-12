import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/cubits/notes.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/simple_bloc_observer.dart';
import 'package:notesapp/views/home_page.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocobserver();
  Hive.registerAdapter(NotemodelAdapter());
  await Hive.openBox<Notemodel>('notes box');
  
  runApp(const Notesapp());
}

class Notesapp extends StatelessWidget {
  const Notesapp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Notescubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: homepage(),
      ),
    );
  }
}
