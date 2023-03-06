import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: MainApp(),
    ));

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<String> say = [
    'there is no point in being grown up if you can not be childich sometimes',
    'hi',
    'what is up'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        title: Text(
          'helooooo',
          style: TextStyle(color: Colors.green[900]),
        ),
        centerTitle: true,
      ),
      body: Column(
          children: say
              .map((e) => Text(
                    e,
                    style: TextStyle(color: Colors.green[900]),
                  ))
              .toList()),
    );
  }
}
