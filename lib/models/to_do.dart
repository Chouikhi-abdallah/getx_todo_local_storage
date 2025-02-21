import 'package:uuid/uuid.dart';

class ToDo {
  String id;
   String title;
   bool isDone;

  ToDo({
      String? id,
      required this.title,
      required this.isDone
    }) : id = id ?? Uuid().v4();
}