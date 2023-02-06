import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todo_model.dart';

class TodoCard extends StatelessWidget {
  late TodoModel todoItem;

  TodoCard(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todoItem.id!),
      onDismissed: (direction) {},
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.green,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.check, color: Colors.white, size: 40),
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
