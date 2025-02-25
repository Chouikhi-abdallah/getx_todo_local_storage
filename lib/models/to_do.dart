import 'package:uuid/uuid.dart';

import 'dart:convert';

class ToDo {
  String id;
  String title;
  bool isDone;

  ToDo({
    String? id,
    required this.title,
    required this.isDone,
  }) : id = id ?? const Uuid().v4();

  // Convert a ToDo object to a JSON Map
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isDone': isDone,
      };

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      title: json['title'],
      isDone: json['isDone'],
    );
  }

  static String encode(List<ToDo> todos) => jsonEncode(
        todos.map<Map<String, dynamic>>((todo) => todo.toJson()).toList(),
      );

  static List<ToDo> decode(String todos) =>
      (jsonDecode(todos) as List<dynamic>)
          .map<ToDo>((item) => ToDo.fromJson(item))
          .toList();
}
