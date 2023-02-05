import 'package:flutter/material.dart';

import '../widgets/todo_list.dart';
import './add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddTodoScreen.routeName);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: TodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddTodoScreen.routeName);
          },
          child: const Icon(Icons.add),
        ));
  }
}
