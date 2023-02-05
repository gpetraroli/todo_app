import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/todo_model.dart';

class TodoCard extends StatelessWidget {
  late TodoModel todoItem;

  TodoCard(this.todoItem);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      child: InkWell(
        onTap: () {},
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
