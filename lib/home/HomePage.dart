import 'package:flutter/material.dart';
import 'package:flutter_neweducation/baselib/MyHttpUtil.dart';
import 'package:flutter_neweducation/baselib/RequestListener.dart';
import 'package:flutter_neweducation/baselib/api.dart';
import 'package:flutter_neweducation/baselib/baseresponse_entity.dart';


import 'package:flutter_swiper/flutter_swiper.dart';

import 'modle/banner_data_entity.dart';

//首页界面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BannerDataList> bannerList = List<BannerDataList>();

  //是否保存状态
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    _sendGetRequest();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("首页"),
      ),
      body: FutureBuilder(builder: (context, snapshot) {
        return Container(
            height: 180,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  bannerList[index].previewUrl,
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: bannerList.length,
              pagination: new SwiperPagination(),
            ));
      }),
    );
  }

  _sendGetRequest() {
    MyHttpUtil.instance.get(
        Api.HOME_BANNER_LIST,
        RequestListener(
            onSuccessListener: (BaseResponseEntity data) {
              BannerDataEntity bannerDataEntity =
                  BannerDataEntity.fromJson(data.data);
              setState(() {
                bannerList = bannerDataEntity.xList;
              });
            },
            onErrorListener: (BaseResponseEntity errorData) {}));
  }
}
