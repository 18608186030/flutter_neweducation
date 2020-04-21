import 'package:flutter/material.dart';
import 'package:flutter_neweducation/baselib/net/api.dart';
import 'package:flutter_neweducation/baselib/net/DioManager.dart';
import 'package:flutter_neweducation/baselib/net/NetMethod.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'modle/banner_data_entity.dart';

//首页界面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerDataList> bannerList = List<BannerDataList>();

  //是否保存状态
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getBannerData();
  }

  @override
  Widget build(BuildContext context) {
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

  _getBannerData() {
    // 返回 LoginEntity
    DioManager.instance.request<BannerDataEntity>(
        NetMethod.GET, Api.HOME_BANNER_LIST, success: (data) {
      setState(() {
        bannerList = data?.xList;
      });
    }, error: (data) {});
  }
}
