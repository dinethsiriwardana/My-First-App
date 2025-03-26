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
                card("title 1", 'asudfghkuysgrdyfuo'),
                card("title 2", 'esituhjdio'),
                card("title 3", 'mbsdriofx'),
                card("title 4", 'svrnised'),
                card("title 5", 'asudfghkuysgrdyfuo'),
                card("title 6", 'asudfghkuysgrdyfuo'),
              ]),
            ),
          ),
        ),
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
            onPressed: () {},
            icon: Icon(Icons.done),
          )
        ],
      ),
    );
  }
}
