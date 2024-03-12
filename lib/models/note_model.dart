import 'package:hive/hive.dart';
part 'note_model.g.dart';
@HiveType(typeId: 0)
class Notemodel extends HiveObject {
  @HiveField(0)
   String title;
  @HiveField(1)
   String subtitle;
  @HiveField(2)
  final String date;
  @HiveField(3)
   int color;

  Notemodel(
      {required this.title,
      required this.subtitle,
      required this.date,
      required this.color});
}
