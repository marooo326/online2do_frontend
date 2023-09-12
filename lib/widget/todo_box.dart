import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_ui/constants/dummy.dart';
import 'package:responsive_ui/models/todo.dart';
import 'package:responsive_ui/models/user.dart';

class TodoBox extends StatefulWidget {
  const TodoBox({super.key});

  @override
  State<TodoBox> createState() => _TodoBoxState();
}

class _TodoBoxState extends State<TodoBox> {
  late Future<List<Todo>> todos;

  Future<List<Todo>> fetchData() async {
    await Future.delayed(const Duration(seconds: 1));
    List<dynamic> parsedJson = await jsonDecode(dummyData);
    return parsedJson.map((json) => Todo.fromJson(json)).toList();
  }

  @override
  void initState() {
    todos = fetchData();
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
            future: todos,
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
                            value: snapshot.data![index].completed,
                            onChanged: (bool? state) {
                              setState(() {
                                snapshot.data![index].completed = state!;
                              });
                            },
                          ),
                          Text(
                            snapshot.data![index].task,
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
