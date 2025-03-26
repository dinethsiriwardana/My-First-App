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
        backgroundColor: const Color.fromARGB(136, 189, 189, 189),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
                card(),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Container card() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[300]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title"),
              Text("dec"),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done),
          )
        ],
      ),
    );
  }
}
