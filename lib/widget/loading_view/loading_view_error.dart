import 'package:flutter/material.dart';
import 'package:flutter_neweducation/utils/image_util.dart';

///加载中页面
class LoadingViewError extends StatelessWidget {
  final GestureTapCallback errorRetryListener;

  LoadingViewError(this.errorRetryListener);

  @override
  Widget build(BuildContext context) {
    return _buildLoadingWidget();
  }

  Widget _buildLoadingWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 120.00,
          height: 120.00,
          child: Image.asset(ImageUtil.getImagePath("ic_error_page")),
        ),
        GestureDetector(
          onTap: errorRetryListener,
          child: Padding(
            padding: EdgeInsets.all(20.00),
            child: Text(
              "加载错误\n点击重新加载",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontSize: 28.00),
            ),
          ),
        ),
      ],
    );
  }
}
