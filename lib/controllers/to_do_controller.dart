import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_todo_local_storage/controllers/toDoRepo.dart';
import 'package:getx_todo_local_storage/models/to_do.dart';
import 'package:getx_todo_local_storage/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoController extends GetxController implements TodoRepo {
  var todo_list = <ToDo>[].obs;
  final SharedPreferences prefs = getIt.get<SharedPreferences>();

  @override
  void addToDo(ToDo to_do) async {
    List<String> lists = prefs.getStringList("todos") ?? [];
    //todo_list.add(to_do);
    lists.add(jsonEncode(to_do.toJson()));
    prefs.setStringList("todos", lists);
    print(lists);
    todo_list.value = getAllTodo();

    todo_list.refresh();
  }

  List<ToDo> getAllTodo() {
    List<String> lists = prefs.getStringList("todos") ?? [];
    return lists.map((json) => ToDo.fromJson(jsonDecode(json))).toList();
  }

  void getAll() {
    todo_list.value = getAllTodo();
    print("here ");
    print(todo_list);
    todo_list.refresh();
  }

  @override
  void updateToDostatus(String id) {
    List<String> lists = prefs.getStringList("todos") ?? [];
    List<ToDo> listeToDo = [];
    lists.forEach((todo) {
      ToDo t = ToDo.fromJson(jsonDecode(todo));

      if (t.id != id) {
        listeToDo.add(t);
      } else {
        t.isDone = !t.isDone;
        listeToDo.add(t);
      }
    });

    todo_list.value = listeToDo;
    todo_list.refresh();
  }

  @override
  void removeToDo(String id) {
    List<String> lists = prefs.getStringList("todos") ?? [];
    List<ToDo> listeToDo = [];
    lists.forEach((todo) {
      ToDo t = ToDo.fromJson(jsonDecode(todo));
      if (t.id != id) {
        listeToDo.add(t);
      }
    });
    todo_list.value = listeToDo;
    todo_list.refresh();
  }
}
