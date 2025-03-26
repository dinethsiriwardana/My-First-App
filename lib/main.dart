import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map data = {
    "title1": "First Task",
    "title2": "Second Task",
    "title3": "Third Task",
    "title4": "Fourth Task",
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
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
              setState(() {
                data["title${data.length + 1}"] = "Task ${data.length + 1}";
              });
            },
            child: Icon(Icons.add)),
      ),
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
