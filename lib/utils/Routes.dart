import 'package:flutter/material.dart';
import '../my/DemoPage.dart';
import '../MainPage.dart';

// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (context) => MainPage());
    case "c":
      return MaterialPageRoute(
          builder: (context) => Demopage(arguments: settings.arguments));
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
            body: Center(
          child: Text("Page not found"),
        ));
      });
  }
};
