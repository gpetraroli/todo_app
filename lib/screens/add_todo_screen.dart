import 'package:flutter/material.dart';

import '../widgets/todo_form.dart';

class AddTodoScreen extends StatelessWidget {
  static const routeName = '/add-todo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: TodoForm(),
      ),
    );
  }
}
