import 'package:flutter/material.dart';

import '../widgets/todo_list.dart';
import './add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            bottom: const TabBar(
              tabs: [
                Tab(
                  text: 'Todo',
                ),
                Tab(
                  text: 'Completed',
                ),
              ],
            )),
        body: TabBarView(children: [TodoList(false), TodoList(true)]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddTodoScreen.routeName);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
