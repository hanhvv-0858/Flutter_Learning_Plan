
import 'package:backend/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

import 'firestore/services.dart';


void main() async {
//  var services = new HttpServices();
  var services = new FirebaseServices();
  var controller = new TodoController(services);

  runApp(TodoApp(controller: controller));
}

class TodoApp extends StatelessWidget {
  final TodoController controller;

  TodoApp({this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(controller: controller),
    );
  }
}
