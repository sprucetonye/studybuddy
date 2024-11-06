import 'package:flutter/material.dart';
import 'package:studybuddy/components/todo_tiles.dart';
import 'package:studybuddy/components/create_dialog_box_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _controller = TextEditingController();
  List<List<dynamic>> toDoList = [
    ["Share ScreenShots of your code", false],
    ["Write a proper readme file with photos", false],
    ["Share your GitHub link", false],
    ["Write a blog about your project", false],
  ];
// create pop

  void saveNewTask() {
    setState(() {
      toDoList.add([
        _controller.text,
        false,
      ]);
      _controller.clear();
      Navigator.pop(context);
    });
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
      // Update the completion status based on the checkbox value
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: const Text("Study Buddy"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) {
              deleteTask(index);
            },

            // onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
