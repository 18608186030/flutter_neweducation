import 'package:flutter/material.dart';
import 'package:flutter_neweducation/net/baseresponse_entity.dart';
import 'package:flutter_neweducation/net/MyHttpUtil.dart';
import 'package:flutter_neweducation/net/RequestListener.dart';

//福利界面
class WelfarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _sendGetRequest();
    return Scaffold(
      appBar: AppBar(
        title: Text("福利"),
      ),
    );
  }

  _sendGetRequest() {
    MyHttpUtil.instance.get(
        "admin/public/sys/dict/type/WELFARE_MENU_CONFIG",
        RequestListener(
            onSuccessListener: (BaseResponseEntity data) => print('成功'),
            onErrorListener: (BaseResponseEntity errorData) => print('失败}')));
  }
}
