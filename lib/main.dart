import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/add_todo_screen.dart';

import '../providers/todo_list_provider.dart';

import '../screens/home_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TodoListProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          AddTodoScreen.routeName: (context) => AddTodoScreen(),
        },
      ),
    );
  }
}
