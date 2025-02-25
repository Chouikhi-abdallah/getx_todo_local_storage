import 'package:getx_todo_local_storage/models/to_do.dart';

abstract class TodoRepo {
  void addToDo(ToDo todo);

  void updateToDostatus(String id);

  void removeToDo(String id);
  void getAll();
}
