import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx_todo_local_storage/controllers/to_do_controller.dart';
import 'package:getx_todo_local_storage/widgets/form_dialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ToDoController toDoController = Get.put(ToDoController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        title: Text(
          'TO DO',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      backgroundColor: Colors.yellow[200],
      body: Padding(
          padding: EdgeInsets.all(40),
          child: GetX<ToDoController>(builder: (_) {
            return ListView.separated(
                itemBuilder: (ctx, index) => Slidable(
                      endActionPane:
                          ActionPane(motion: StretchMotion(), children: [
                        SlidableAction(
                          onPressed: (_) {},
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          borderRadius: BorderRadius.circular(9),
                        )
                      ]),
                      child: Container(
                        width: double.infinity,
                        height: 77,
                        decoration: BoxDecoration(
                            color: Colors.yellow[500],
                            borderRadius: BorderRadius.circular(9)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              value: toDoController.todo_list[index].isDone,
                              onChanged: (newValue) {
                                toDoController.updateToDostatus(
                                    toDoController.todo_list[index].id);
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              toDoController.todo_list[index].title,
                              style: TextStyle(
                                  decoration:
                                      !toDoController.todo_list[index].isDone
                                          ? null
                                          : TextDecoration.lineThrough),
                            )
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (ctx, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: toDoController.todo_list.length);
          })),
      floatingActionButton: FormDialog(),
    );
  }
}
