import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/todo_model.dart';
import '../providers/todo_list_provider.dart';

class TodoCard extends StatelessWidget {
  late TodoModel todoItem;

  TodoCard(this.todoItem);

  @override
  Widget build(BuildContext context) {
    final todoListProvider =
        Provider.of<TodoListProvider>(context, listen: false);

    return Dismissible(
      key: Key(todoItem.id!),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          todoListProvider.removeTodoItem(todoItem);
        } else {
          final updatedTodoItem = TodoModel.withId(
            id: todoItem.id,
            title: todoItem.title,
            body: todoItem.body,
            isDone: !todoItem.isDone,
            date: todoItem.date,
          );
          todoListProvider.updateTodoItem(updatedTodoItem);
        }
      },
      background: Container(
        color: todoItem.isDone ? Colors.orange : Colors.green,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        child: todoItem.isDone
            ? const Icon(Icons.exit_to_app, color: Colors.white, size: 40)
            : const Icon(Icons.check, color: Colors.white, size: 40),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white, size: 40),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: todoItem.isDone ? Colors.green : Colors.red,
              width: 5,
            ),
          ),
        ),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('yyyy-MM-dd : HH:MM').format(todoItem.date),
              ),
              const SizedBox(height: 10),
              Text(todoItem.title),
              const SizedBox(height: 10),
              Text(todoItem.body),
            ],
          ),
        ),
      ),
    );
  }
}
