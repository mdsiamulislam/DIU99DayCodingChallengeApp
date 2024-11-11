import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabStyle extends StatefulWidget {
  final String timeState;
  final String timeStatePeriod;
  final String taskKey;

  const TabStyle({
    super.key,
    required this.timeState,
    required this.timeStatePeriod,
    required this.taskKey,
  });

  @override
  State<TabStyle> createState() => _TabStyleState();
}

class _TabStyleState extends State<TabStyle> {
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
    
  }

  // Load tasks from SharedPreferences for the specific time period
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString(widget.taskKey);

    if (tasksString != null) {
      setState(() {
        _tasks = List<Map<String, dynamic>>.from(
          json.decode(tasksString).map((task) => Map<String, dynamic>.from(task)),
        );
      });
    }
  }

  // Save tasks to SharedPreferences for the specific time period
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String tasksString = json.encode(_tasks);
    await prefs.setString(widget.taskKey, tasksString);
  }

  // Add a new task
  void addTask() {
    if (textEditingController1.text.isNotEmpty && textEditingController2.text.isNotEmpty) {
      setState(() {
        _tasks.add({
          'taskTitle': textEditingController1.text,
          'taskDescription': textEditingController2.text,
          'taskStatus': false,
        });
        textEditingController1.clear();
        textEditingController2.clear();
      });
      _saveTasks();
    }
  }

  // Toggle task status
  void toggleTaskStatus(int index) {
    setState(() {
      _tasks[index]['taskStatus'] = !_tasks[index]['taskStatus'];
    });
    _saveTasks();
  }

  // Clear all tasks
  void clearTasks() async {
    setState(() {
      _tasks.clear();
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(widget.taskKey);
  }

  // Delete a specific task
  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  // Edit a specific task
  void editTask(int index) {
    textEditingController1.text = _tasks[index]['taskTitle'];
    textEditingController2.text = _tasks[index]['taskDescription'];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              inputField(textEditingController1, 'Task Title'),
              const SizedBox(height: 10),
              inputField(textEditingController2, 'Task Description'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _tasks[index]['taskTitle'] = textEditingController1.text;
                  _tasks[index]['taskDescription'] = textEditingController2.text;
                });
                _saveTasks();
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            inputField(textEditingController1, 'Task Title'),
            const SizedBox(height: 10),
            inputField(textEditingController2, 'Task Description'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: const Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: addTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black26,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 1,
                ),
              ),
            ),
            const SizedBox(height: 40),
            buildTaskSection("You Have to do", false),
            const SizedBox(height: 30),
            buildTaskSection("You Complete", true),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildTaskSection(String title, bool completed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(completed ? Icons.done_all : Icons.push_pin_outlined),
            Text("      $title"),
          ],
        ),
        const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _tasks.length,
          itemBuilder: (BuildContext context, int index) {
            bool isChecked = _tasks[index]['taskStatus'];
            return (isChecked == completed) ? pinTask(index) : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Column pinTask(int index) {
    bool isChecked = _tasks[index]['taskStatus'];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => toggleTaskStatus(index),
                    child: Icon(
                      isChecked ? Icons.check_box : Icons.check_box_outline_blank,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _tasks[index]['taskTitle'],
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          _tasks[index]['taskDescription'],
                          style: const TextStyle(color: Colors.white60),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: const Text('Delete'),
                          onTap: () {
                            deleteTask(index);
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: const Text('Edit'),
                          onTap: () {
                            Navigator.of(context).pop();
                            editTask(index);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  TextField inputField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.subject, color: Colors.grey),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(53, 58, 64, 1),
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
