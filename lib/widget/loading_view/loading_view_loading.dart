import 'package:flutter/material.dart';

///加载中页面
class LoadingViewLoading extends StatelessWidget {
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
          width: 52.00,
          height: 52.00,
          child: CircularProgressIndicator(
            strokeWidth: 5.00,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.00),
          child: Text(
            "加载中...",
            style: TextStyle(color: Color.fromARGB(255, 51, 51, 51), fontSize: 28.00),
          ),
        ),
      ],
    );
  }
}
