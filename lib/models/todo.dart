class Todo {
  final int id;
  final String contents;
  bool isCompleted;
  final String author;

  Todo(
      {required this.id,
      required this.contents,
      required this.isCompleted,
      required this.author});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
        id: json['id'],
        contents: json['contents'],
        isCompleted: json['isCompleted'],
        author: json['author']
        //createdDate: DateTime.parse(json['dueDate']),
        );
  }
}
