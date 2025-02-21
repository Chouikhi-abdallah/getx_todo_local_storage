import 'package:get/get.dart';
import 'package:getx_todo_local_storage/models/to_do.dart';

class ToDoController extends GetxController {
  var todo_list =<ToDo>[].obs;

  void addToDo(ToDo to_do){
    todo_list.add(to_do);
  }
  void updateToDostatus(String id){
    final todoIndex=todo_list.indexWhere((todo)=>todo.id == id);
    todo_list[todoIndex].isDone=!todo_list[todoIndex].isDone;
    todo_list.refresh();
  }
  void removeToDo(String id){
    final todoIndex=todo_list.indexWhere((todo)=>todo.id == id);
    todo_list.removeAt(todoIndex);
    todo_list.refresh();
  }
}