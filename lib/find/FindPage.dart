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
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<String> tabs = ["短视频", "车友圈", "资讯"];

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
        appBar: new AppBar(
            title: Center(
                child: new TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    tabs: tabs.map((v) {
                      return Center(
                        child: new Text(v),
                      );
                    }).toList()))),
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
