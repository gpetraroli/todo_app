import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
import '../models/todo_model.dart';

const String URL =
    'https://tmpdart-default-rtdb.europe-west1.firebasedatabase.app/todo.json';

class TodoListProvider extends ChangeNotifier {
  List<TodoModel> _todoList = [];
  final FirebaseService _fireBaseService = FirebaseService();

  TodoListProvider() {
    fetchData();
    notifyListeners();
  }

  List<TodoModel> get todoList => _todoList;

  fetchData() async {
    // TODO: handle error
    final data = await _fireBaseService.fetchTodos;

    data.forEach((key, value) {
      _todoList.add(TodoModel(
        title: value['title'],
        body: value['body'],
        date: DateTime.parse(value['date']),
        isDone: value['isDone'] == 'true',
      ));
    });

    notifyListeners();
  }

  Future<bool> addTodoItem(TodoModel todoItem) async {
    final success = await _fireBaseService.addTodoItem(todoItem);

    if (success) {
      _todoList.add(todoItem);
      notifyListeners();
    }

    return success;
  }

  void removeTodoItem(TodoModel todoItem) {
    _todoList.remove(todoItem);
    notifyListeners();
  }
}
