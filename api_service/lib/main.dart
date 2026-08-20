import 'package:api_service/screens/task_screen.dart';
import 'package:flutter/material.dart';

/*  import 'models/task.dart';
import 'services/task_api.dart';  */
void main() async{
  /* final task = Task(
    id: 1,
    title: "Learn Flutter",
    completed: false,
  );

  print(task.title); */
/*   final api = TaskApi();
  final tasks = await api.getTasks();

  for (final task in tasks) {
    print(task.title);
    print(task.id);

  } */
  /* final api = TaskApi();

  final task = await api.createTask("Learn Flutter");

  print(task.id);
  print(task.title);
  print(task.completed); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TaskScreen()
    );
  }
}
