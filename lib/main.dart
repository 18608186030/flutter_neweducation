import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'MainPage.dart';

void main() => runApp(MyApp());

//程序入口
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
