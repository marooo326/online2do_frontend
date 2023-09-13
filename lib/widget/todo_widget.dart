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
  late Future<List<Todo>> todos;

  Future<List<Todo>> fetchData(String accessToken) {
    return TodoApiService.getTodos(accessToken);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<User>().username),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🔥TODO LIST🔥",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: fetchData(context.watch<User>().getAccessToken()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 데이터가 아직 로드되지 않은 경우
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // 에러가 발생한 경우
                return Text('Error: ${snapshot.error}');
              } else {
                // 데이터가 로드된 경우
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Checkbox(
                            value: snapshot.data![index].isCompleted,
                            onChanged: (bool? state) {
                              setState(() {
                                snapshot.data![index].isCompleted = state!;
                              });
                            },
                          ),
                          Text(
                            snapshot.data![index].contents,
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
