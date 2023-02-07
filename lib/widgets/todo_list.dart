import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/todo_list_provider.dart';
import '../widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  var _showTodoCompleted;

  TodoList(this._showTodoCompleted);

  @override
  Widget build(BuildContext context) {
    final todoListProvider = Provider.of<TodoListProvider>(context);
    final todoNotDone = todoListProvider.todoList
        .where((todo) => todo.isDone == _showTodoCompleted)
        .toList();

    return todoNotDone.isEmpty
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
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
                  ),
                  child: const Text('Add a todo'),
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: todoNotDone.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: TodoCard(todoNotDone[index]),
              );
            },
          );
  }
}
