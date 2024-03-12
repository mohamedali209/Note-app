import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/add_notes_cubit.dart';

class colorItem extends StatelessWidget {
  const colorItem({super.key, required this.isactive, required this.colors});
  final bool isactive;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? CircleAvatar(
            backgroundColor: Colors.red,
            radius: 38,
            child: CircleAvatar(
              radius: 33,
              backgroundColor: colors,
            ),
          )
        : CircleAvatar(
            radius: 36,
            backgroundColor: colors,
          );
  }
}

class ColorsListview extends StatefulWidget {
  const ColorsListview({super.key});

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int currentindex = 0;
  List<Color> colors = [
    Colors.amber,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.white,
    Colors.cyanAccent
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                currentindex = index;
                BlocProvider.of<AddNotesCubit>(context).color = colors[index];
                setState(() {});
              },
              child: colorItem(
                colors: colors[index],
                isactive: currentindex == index,
              ));
        },
      ),
    );
  }
}
