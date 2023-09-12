class Todo {
  final int id;
  final String task;
  bool completed;
  final DateTime dueDate;

  Todo(
      {required this.id,
      required this.task,
      required this.completed,
      required this.dueDate});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      task: json['task'],
      completed: json['completed'],
      dueDate: DateTime.parse(json['dueDate']),
    );
  }
}
