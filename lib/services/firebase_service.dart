import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/variables.dart';
import '../models/todo_model.dart';

class FirebaseService {
  Future<Map<String, dynamic>?> get fetchTodos async {
    final response = await http.get(Uri.parse(Variables.firebaseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<String> addTodoItem(TodoModel todoItem) async {
    final response = await http.post(Uri.parse(Variables.firebaseUrl),
        body: json.encode({
          'title': todoItem.title,
          'body': todoItem.body,
          'date': todoItem.date.toString(),
          'isDone': todoItem.isDone.toString(),
        }));

    if (response.statusCode == 200) {
      return json.decode(response.body)['name'];
    } else {
      throw Exception('Failed to add todo item');
    }
  }

  Future<void> deleteTodoItem(String id) async {
    final response = await http.delete(Uri.parse(
        'https://tmpdart-default-rtdb.europe-west1.firebasedatabase.app/todo/$id.json'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete todo item');
    }
  }

  Future<void> updateTodoItem(TodoModel todoItem) async {
    final response = await http.patch(Uri.parse(
        'https://tmpdart-default-rtdb.europe-west1.firebasedatabase.app/todo/${todoItem
            .id}.json'),
        body: json.encode({
          'title': todoItem.title,
          'body': todoItem.body,
          'date': todoItem.date.toString(),
          'isDone': todoItem.isDone.toString(),
        }));

    if (response.statusCode != 200) {
      throw Exception('Failed to update todo item');
    }
  }
}
