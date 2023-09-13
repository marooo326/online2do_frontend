import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/models/todo.dart';
import 'package:responsive_ui/models/user.dart';
import 'package:responsive_ui/services/todo_api_service.dart';

class TodoWidget extends StatefulWidget {
  const TodoWidget({super.key});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  // snapshot 데이터의 복사본
  List<Todo>? todos;
  final TextEditingController _controller = TextEditingController();

  void fetchTodoData(String accessToken) async {
    todos = await TodoApiService.getTodos(accessToken);
    setState(() {});
  }

  void createNewTodo(String accessToken, String contents) async {
    int id = await TodoApiService.postTodo(accessToken, contents);
    setState(() {
      todos!.add(Todo(
          id: id, contents: contents, isCompleted: false, author: "author"));
      _controller.clear();
    });
  }

  void updateTodoState(String accessToken, Todo todo, bool state) {
    TodoApiService.updateTodo(accessToken, todo.id, state);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String accessToken = context.watch<User>().getAccessToken();

    if (todos == null) {
      // 데이터가 아직 로드되지 않은 경우
      fetchTodoData(accessToken);
      return const Center(child: CircularProgressIndicator());
    } else {
      // 데이터가 로드된 경우
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<User>().username,
            ),
            const Text(
              "🔥TODO LIST🔥",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 30,
              child: ListView.builder(
                itemCount: todos!.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Checkbox(
                        value: todos![index].isCompleted,
                        onChanged: (bool? state) {
                          updateTodoState(accessToken, todos![index], state!);
                          setState(() {
                            todos![index].isCompleted = state;
                          });
                        },
                      ),
                      Text(
                        todos![index].contents,
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                onSubmitted: (contents) => createNewTodo(accessToken, contents),
                decoration: const InputDecoration(
                  hintText: "🔥Enter Todo and press Enter🔥",
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
