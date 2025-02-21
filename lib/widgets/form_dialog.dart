import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_local_storage/controllers/to_do_controller.dart';
import 'package:getx_todo_local_storage/models/to_do.dart';

class FormDialog extends StatelessWidget {
  const FormDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RxString entredToDotitle = "".obs;
    final ToDoController toDoController = Get.put(ToDoController());

    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.yellow[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              content: Container(
                height: 150,
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => entredToDotitle.value = value,
                      decoration: InputDecoration(
                        hintText: 'Add a new Task',
                        fillColor: Colors.yellow[300],
                        border: OutlineInputBorder(),
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          onPressed: () {
                            toDoController.addToDo(
                              ToDo(title: entredToDotitle.value, isDone: false),
                            );
                            Get.back();  
                          },
                          backgroundColor: Colors.yellow[500],
                          shape: ContinuousRectangleBorder(),
                          child: Text('Save'),
                        ),
                        SizedBox(width: 14),
                        FloatingActionButton(
                          onPressed: () {
                            Get.back();  // Close the dialog
                          },
                          shape: ContinuousRectangleBorder(),
                          backgroundColor: Colors.yellow[500],
                          child: Text('Cancel'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      shape: CircleBorder(),
      backgroundColor: Colors.yellow[500],
      child: Icon(Icons.add),
    );
  }
}
