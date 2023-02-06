import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/todo_card.dart';

import '../providers/todo_list_provider.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoListProvider = Provider.of<TodoListProvider>(context);

    return todoListProvider.todoList.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('No todos yet'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/add-todo');
                  },
                  child: const Text('Add a todo'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: todoListProvider.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: TodoCard(todoListProvider.todoList[index]),
              );
            },
          );
  }
}
