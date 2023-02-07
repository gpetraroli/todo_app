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

    if (data == null) {
      return;
    }

    data.forEach((key, value) {
      _todoList.add(TodoModel.withId(
        id: key,
        title: value['title'],
        body: value['body'],
        date: DateTime.parse(value['date']),
        isDone: value['isDone'] == 'true',
      ));
    });

    notifyListeners();
  }

  void addTodoItem(TodoModel todoItem) async {
    final id = await _fireBaseService.addTodoItem(todoItem);
    todoItem.id = id;

    _todoList.add(todoItem);
    notifyListeners();
  }

  void removeTodoItem(TodoModel todoItem) {
    _todoList.remove(todoItem);
    _fireBaseService.deleteTodoItem(todoItem.id!);
    notifyListeners();
  }

  void updateTodoItem(TodoModel todoItem) {
    _fireBaseService.updateTodoItem(todoItem);
    _todoList[_todoList.indexWhere((element) => element.id == todoItem.id)] =
        todoItem;
    notifyListeners();
  }
}
