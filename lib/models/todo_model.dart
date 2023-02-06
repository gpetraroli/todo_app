class TodoModel {
  String? id;
  String title;
  String body;
  DateTime date;
  bool isDone;

  TodoModel({
    required this.title,
    this.body = '',
    required this.date,
    this.isDone = false,
  });

  TodoModel.withId({
    required this.id,
    required this.title,
    this.body = '',
    required this.date,
    this.isDone = false,
  });
}
