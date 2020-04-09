import 'package:flutter/material.dart';
import 'package:flutter_neweducation/net/BaseResponse.dart';
import 'package:flutter_neweducation/net/MyHttpUtil.dart';
import 'package:flutter_neweducation/net/RequestListener.dart';
//福利界面
class WelfarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _sendGetRequest();
    return Text("Main");
  }

  _sendGetRequest() {
    MyHttpUtil.instance.get(
        "admin/public/sys/dict/type/WELFARE_MENU_CONFIG",
        RequestListener(
            onSuccessListener: (BaseResponse data) =>print('成功'),
            onErrorListener: (BaseResponse errorData) => print('失败}')
        )
    );
  }
}