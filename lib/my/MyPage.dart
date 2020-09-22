import 'package:flutter/material.dart';

//我的界面
class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人中心"),
      ),
      body: RaisedButton(
        child: Text("跳转"),
        onPressed: () {
          Navigator.pushNamed(context, '/demoPage',arguments:{'title':"nihao"});
        }
      ),
    );
  }
}
