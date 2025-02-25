import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_local_storage/controllers/to_do_controller.dart';
import 'package:getx_todo_local_storage/screens/home_screen.dart';
import 'package:getx_todo_local_storage/utils/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  Get.put(ToDoController()).getAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}
