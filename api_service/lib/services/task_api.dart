import '../models/task.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TaskApi {

  Future<List<Task>> getTasks()async{
  try{

    final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );

    if(response.statusCode==200){
      final data = jsonDecode(response.body);
      List<Task>tasks=[];
      for(final item in data){
        final task = Task(
          id: item["id"],
          title: item["title"],
          completed: item["completed"],
        );
        tasks.add(task);

      }
      return tasks;

    }else{
        throw Exception("Server error: Status code ${response.statusCode}");
      }
  } catch(error){
      throw Exception("Failed to fetch tasks: $error");

    }
/*    final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/todos"),
  );
  final data = jsonDecode(response.body);
 /*  print(response.statusCode);
  print(response.body); */

  List<Task>tasks=[];
  for(final item in data){
    final task = Task(
    id: item["id"],
    title: item["title"],
    completed: item["completed"],
  );
  tasks.add(task);

  }

/*   final item = data[0];

  print("ID: ${item["id"]}");
  print("TITLE: ${item["title"]}");
  print("COMPLETION STATUS: ${item["completed"]}");

  final task = Task(
    id: item["id"],
    title: item["title"],
    completed: item["completed"],
  ); */


  return tasks; */

  }
  Future<Task>createTask(String title)async{

    try{
      final response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/todos"),
        headers: {
           "Content-Type": "application/json",
        },
        body: jsonEncode({
          "title": title,
          "completed": false,
        }),
      );

      if(response.statusCode==201){

        final data = jsonDecode(response.body);
        final task = Task(
              id: data["id"],
              title: data["title"],
              completed: data["completed"]
            );
        return task;

      }else{
        throw Exception("Failed to create task");
      }
    }
    catch(error){
      throw Exception("Cant connect");
    }
   
  }
}