import 'package:flutter/material.dart';

class Demopage extends StatefulWidget {
  final Map arguments;

  Demopage({this.arguments});

  @override
  _DemopageState createState() => _DemopageState(arguments: this.arguments);
}

class _DemopageState extends State<Demopage> {
  Map arguments;

  _DemopageState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Text(arguments['title']),
            onPressed: () {
              Navigator.pop(context);
            }),
        appBar: AppBar(
          title: Text("我是新界面"),
        ));
  }
}
