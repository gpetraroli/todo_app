import 'dart:convert';
import 'package:http/http.dart' as http;

import '../config/variables.dart';
import '../models/todo_model.dart';

class FirebaseService {
  Future<Map<String, dynamic>> get fetchTodos async {
    final response = await http.get(Uri.parse(Variables.firebaseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<bool> addTodoItem(TodoModel todoItem) async {
    final response = await http.post(Uri.parse(Variables.firebaseUrl),
        body: json.encode({
          'title': todoItem.title,
          'body': todoItem.body,
          'date': todoItem.date.toString(),
          'isDone': todoItem.isDone.toString(),
        }));

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to add todo item');
    }
  }
}
