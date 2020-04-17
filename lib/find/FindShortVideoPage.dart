import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_neweducation/baselib/MyHttpUtil.dart';
import 'package:flutter_neweducation/baselib/RequestListener.dart';
import 'package:flutter_neweducation/baselib/api.dart';
import 'package:flutter_neweducation/baselib/baseresponse_entity.dart';

import 'modle/find_short_video_data_entity.dart';

//短视频界面
class FindShortVideoPage extends StatefulWidget {
  @override
  _FindShortVideoPageState createState() => _FindShortVideoPageState();
}

class _FindShortVideoPageState extends State<FindShortVideoPage> {
  List<FindShortVideoDataList> xList;
  var curPage = 0;
  var hasNextPage = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    xList = List();
  }

  @override
  Widget build(BuildContext context) {
    _getData(params: {"curPage": curPage, "pageSize": 20});
    return Container(
      child: EasyRefresh(
        child: ListView.builder(
            itemCount: xList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text(xList[index].title));
            }),
        onRefresh: () async {
          xList.clear();
          curPage = 0;
          _getData(params: {"curPage": curPage, "pageSize": 20});
        },
        onLoad: () async {
          if (hasNextPage) {
            _getData(params: {"curPage": curPage, "pageSize": 20});
          }
        },
      ),
    );
  }

  _getData({params}) {
    MyHttpUtil.instance.post(
        Api.FIND_VIDEO_LIST,
        RequestListener(onSuccessListener: (BaseResponseEntity data) {
          print("成功");
          FindShortVideoDataEntity findShortVideoDataEntity =
              FindShortVideoDataEntity.fromJson(data.data);
          setState(() {
            hasNextPage = findShortVideoDataEntity.hasNextPage;
            xList.addAll(findShortVideoDataEntity.xList);
          });
        }, onErrorListener: (BaseResponseEntity errorData) {
          print("失败");
        }),
        data: params);
  }
}
