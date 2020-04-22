import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_neweducation/baselib/net/api.dart';
import 'package:flutter_neweducation/baselib/net/DioManager.dart';
import 'package:flutter_neweducation/baselib/net/NetMethod.dart';
import 'package:flutter_neweducation/widget/loading_view/loading_view.dart';

import 'modle/find_short_video_data_entity.dart';

//短视频界面
class FindShortVideoPage extends StatefulWidget {
  @override
  _FindShortVideoPageState createState() => _FindShortVideoPageState();
}

class _FindShortVideoPageState extends State<FindShortVideoPage>
    with AutomaticKeepAliveClientMixin {
  List<FindShortVideoDataList> xList;
  var curPage = 1;
  var hasNextPage = false;

  LoadingState loadingState = LoadingState.loading;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    xList = List();
    _getData(curPage);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingView(
      state: loadingState,
      contentWidget: Container(
        color: Colors.white,
        child: EasyRefresh(
          child: ListView.builder(
              itemCount: xList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(xList[index].title));
              }),
          onRefresh: () async {
            xList.clear();
            curPage = 1;
            _getData(curPage);
          },
          onLoad: () async {
            if (hasNextPage) {
              _getData(curPage);
            }
          },
        ),
      ),
      allRetryListener: () {
        _getData(curPage);
      },
    );
  }

  _getData(curPage) {
    DioManager.instance.request<FindShortVideoDataEntity>(
        NetMethod.POST, Api.FIND_VIDEO_LIST,
        data: {"curPage": curPage, "pageSize": 10}.toString(), success: (data) {
      setState(() {
        loadingState = LoadingState.success;
        curPage = data.nextPage;
        hasNextPage = data.hasNextPage;
        xList.addAll(data.xList);
      });
    }, error: (data) {
      loadingState = LoadingState.error;
    });
  }
}
