import 'package:flutter/material.dart';
import 'package:flutter_neweducation/utils/image_util.dart';

///加载中页面
class LoadingViewEmpty extends StatelessWidget {
  final GestureTapCallback emptyRetryListener;

  LoadingViewEmpty(this.emptyRetryListener);

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
          height:120.00,
          child: Image.asset(ImageUtil.getImagePath("ic_empty_page")),
        ),
        GestureDetector(
          onTap: emptyRetryListener,
          child: Padding(
            padding: EdgeInsets.all(20.00),
            child: Text(
              "暂无数据\n点击重新加载",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontSize: 28.00),
            ),
          ),
        ),
      ],
    );
  }
}
