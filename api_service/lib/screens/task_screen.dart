import 'package:flutter/material.dart';
import '../services/task_api.dart';
import '../models/task.dart';

class TaskScreen extends StatefulWidget{

  const TaskScreen({super.key});

  @override
  State<TaskScreen>createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen>{
  final TaskApi _taskApi = TaskApi();

  String _status = "loading";
  List<Task>_tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void>_loadTasks()async{
    try{
      final tasks = await _taskApi.getTasks();

      setState(() {
        _tasks = tasks;
        _status = "success";
        
      });
      
    }catch(error){
      setState(() {
        _status="error";
        
      });
      

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
          _status == "loading"
          ? const CircularProgressIndicator()
          : _status == "error"
          ? const Text("Something went wrong")
          : _tasks.isEmpty
          ? const Text("No tasks found")
          : Expanded(
              child: ListView(
                children: _tasks
                    .map((task) => Text(task.title))
                    .toList(),
              ),
            )
          ],
        ),
      )
     
    );
  }
}
