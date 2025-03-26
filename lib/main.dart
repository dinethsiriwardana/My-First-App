import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  Map data = {
    "title1": "First Task",
    "title2": "Second Task",
    "title3": "Third Task",
    "title4": "Fourth Task",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(136, 189, 189, 189),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              ...data.entries
                  .map((e) => card(e.key, e.value))
                  .toList(growable: false),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            //  add task by dialog box
            TextEditingController titleController = TextEditingController();
            TextEditingController decController = TextEditingController();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add Task"),
                    content: Column(
                      children: [
                        TextField(
                          controller: titleController,
                        ),
                        TextField(
                          controller: decController,
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel")),
                      TextButton(
                          onPressed: () {
                            data[titleController.text] = decController.text;
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: Text("Add")),
                    ],
                  );
                });
          },
          child: Icon(Icons.add)),
    );
  }

  Container card(String title, String dec) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.blue[300]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(dec),
            ],
          ),
          IconButton(
            onPressed: () {
              // remove item
              setState(() {
                data.remove(title);
              });
            },
            icon: Icon(Icons.done),
          )
        ],
      ),
    );
  }
}
