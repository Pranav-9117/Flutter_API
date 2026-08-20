import '../models/task.dart';

class TaskApi {

  Future<List<Task>> getTasks()async{
  await Future.delayed(const Duration(seconds: 2));

  return [
    Task(id: 1, title: "Learn Dart", completed: true),
    Task(id: 2, title: "Learn Flutter", completed: false)
  ];

  }
}