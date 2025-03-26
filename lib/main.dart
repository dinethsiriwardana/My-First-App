import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Todo")),
        body: Center(
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(20),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(color: Colors.grey),
              child: Column(
                children: [
                  Text("Title"),
                  Text("dec"),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
