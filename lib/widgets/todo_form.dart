import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/providers/todo_list_provider.dart';

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  var _enteredTitle = '';
  var _enteredBody = '';

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final success =
          Provider.of<TodoListProvider>(context, listen: false).addTodoItem(
        TodoModel(
          title: _enteredTitle,
          body: _enteredBody,
          date: DateTime.now(),
        ),
      );

      success.then((value) {
        if (value) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Todo added successfully')),
          );
        }
      });
    }
  }

  String? _validateNotEmpty(String? value, String subject) {
    if (value == null || value.isEmpty) {
      return 'Please enter a $subject';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onSaved: (value) {
                _enteredTitle = value!;
              },
              validator: (value) {
                return _validateNotEmpty(value, 'title');
              },
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              maxLines: 10,
              onSaved: (value) {
                _enteredBody = value!;
              },
              validator: (value) {
                return _validateNotEmpty(value, 'body');
              },
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                labelText: 'Body',
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _save,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
