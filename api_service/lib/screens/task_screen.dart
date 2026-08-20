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
  final TextEditingController _textController = TextEditingController();

  String _status = "loading";
  List<Task>_tasks = [];

  bool _isCreating = false;
  String? _createError;

  String? _valid;
  @override
  void initState() {
    super.initState();
    _loadTasks();
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
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
  Future<void>_createTask()async{
    
      final title = _textController.text.trim();

      if (title.isEmpty) {
        setState(() {
          _valid = "Field cannot be empty";
        });
        return ;
      }else if(title.length<3){
        setState(() {
          _valid = "Enter atleast 3 characters";
        });
        return ;
      }

      setState(() {
        _isCreating = true;
        _createError = null;
      });
      try {
        final task = await _taskApi.createTask(title);

        setState(() {
          _tasks.add(task);
          _isCreating = false;
          _valid=null;
        });
        _textController.clear();
      } catch (error) {
        setState(() {
          _isCreating = false;
          _createError = "Failed to create task";
          _valid=null;
          }
        );

        }

    }

    Future<void>_toggleTask(Task task)async{
      bool curStatus = task.completed;
      int curId = task.id;

      try{
        final updatedTask = await _taskApi.updateTask(curId, !curStatus);
        setState(() {
          final index = _tasks.indexWhere(
            (item) => item.id == task.id,
          );

          _tasks[index] = updatedTask;
        });
      }catch(error){
        
      }

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: "Enter task...",
              ),
            ),
            if(_valid!=null)
              Text("$_valid"),
            ElevatedButton(
              onPressed: _isCreating ? null : _createTask,
              child: const Text("Add Task"),
            ),
          _status == "loading"
          ? const CircularProgressIndicator()
          : _status == "error"
          ? const Text("Something went wrong")
          : _tasks.isEmpty
          ? const Text("No tasks found")
          : Expanded(
              child: ListView(
                children: _tasks
                    .map((task) => CheckboxListTile(
                      value: task.completed, 
                      onChanged: (_){
                      _toggleTask(task);
                    },
                    title: Text(task.title)
                  ))
                    .toList(),
              ),
            )
          ],
        ),
      )
     
    );
  }
}
