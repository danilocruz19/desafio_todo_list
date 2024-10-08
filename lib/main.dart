import 'package:desafio_todo_list/card_das_tarefas.dart';
import 'package:desafio_todo_list/screen_todo_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: TodoList(),
    );
  }
}

