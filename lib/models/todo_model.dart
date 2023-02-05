class TodoModel {
  String title;
  String body;
  DateTime date;
  bool isDone;

  TodoModel(
      {required this.title,
      this.body = '',
      required this.date,
      this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
