import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Todo App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        brightness: Brightness.light,
      ),
      home: TaskListApp(),
    );
  }
}

class TaskListApp extends StatefulWidget {
  @override
  _TaskListAppState createState() => _TaskListAppState();
}

class _TaskListAppState extends State<TaskListApp> {
  Map<String, String> tasks = {
    "Task 1": "Research studies",
    "Task 2": "Study for the database exam",
    "Task 3": "Workout in the evening",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 207, 125, 218),
      appBar: AppBar(
        title: Text("My Todo App", style: TextStyle(fontFamily: 'Pacifico', fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.purpleAccent,
      ),
      body: SafeArea(
        child: tasks.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Text("No tasks yet!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  String title = tasks.keys.elementAt(index);
                  String desc = tasks[title]!;
                  return taskCard(title, desc);
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () => showAddTaskDialog(context),
        child: Icon(Icons.add, size: 30),
      ),
    );
  }

  Widget taskCard(String title, String desc) {
    return Dismissible(
      key: Key(title),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        color: Colors.redAccent,
        child: Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      onDismissed: (direction) {
        setState(() {
          tasks.remove(title);
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Task Removed"),
          duration: Duration(seconds: 1),
        ));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.purple,
            child: Icon(Icons.task, color: Colors.white),
          ),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(desc),
          trailing: IconButton(
            icon: Icon(Icons.check_circle, color: Colors.green),
            onPressed: () {
              setState(() {
                tasks.remove(title);
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Task Completed"),
                duration: Duration(seconds: 1),
              ));
            },
          ),
        ),
      ),
    );
  }

  void showAddTaskDialog(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text("Add Task", style: TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Task Title", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: descController,
                decoration: InputDecoration(labelText: "Task Description", border: OutlineInputBorder()),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              onPressed: () {
                if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
                  setState(() {
                    tasks[titleController.text] = descController.text;
                  });
                  Navigator.pop(context);
                }
              },
              child: Text("Add Task"),
            ),
          ],
        );
      },
    );
  }
}
