import 'package:flutter/material.dart';

import 'FindBicycleRidersPage.dart';
import 'FindInformationPage.dart';
import 'FindShortVideoPage.dart';

//发现界面
class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  List<String> tabs = ["短视频", "车友圈", "资讯"];

  @override
  bool get wantKeepAlive => true;

  void initState() {
    super.initState();

    _tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Container(
              width: double.infinity,
              height: 45,
              child:  Center(
                  child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Colors.white,
                      indicatorPadding: EdgeInsets.only(top: 5, bottom: 5),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: tabs.map((v) {
                        return Center(
                          child: Text(v),
                        );
                      }).toList())),
            )),
        body: TabBarView(
            controller: _tabController,
            children: tabs.map((v) {
              if (v == "短视频") {
                return FindShortVideoPage();
              } else if (v == "车友圈") {
                return FindBicycleRidersPage();
              } else {
                return FindInformationPage();
              }
            }).toList()));
  }
}
