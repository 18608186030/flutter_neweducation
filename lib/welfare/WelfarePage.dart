import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neweducation/baselib/net/api.dart';
import 'package:flutter_neweducation/baselib/net/DioManager.dart';
import 'package:flutter_neweducation/baselib/net/NetMethod.dart';
import 'package:flutter_neweducation/welfare/welfaredata_entity.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:webview_flutter/webview_flutter.dart';

//福利界面
class WelfarePage extends StatefulWidget {
  _WelfarePageState createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  List<WelfaredataList> welfaredataList = List<WelfaredataList>();
  TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  void initState() {
    super.initState();
    welfaredataList
        .add(WelfaredataList(name: "货运通", value: "https://www.pgyer.com"));
    welfaredataList
        .add(WelfaredataList(name: "E钱包", value: "https://www.baidu.com"));
    _tabController = TabController(
      length: welfaredataList.length,
      vsync: this,
    );
    _getBannerData();
  }

  _getBannerData() {
    // 返回 LoginEntity
    DioManager.instance.request<WelfaredataEntity>(
        NetMethod.GET, Api.WELFARE_MENU_LIST, success: (data) {
      setState(() {
        welfaredataList = data.xList;
        _tabController = TabController(
          length: welfaredataList.length,
          vsync: this,
        );
      });
    }, error: (data) {});
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
                      tabs: welfaredataList.map((v) {
                        return Center(
                          child: Text(v.name),
                        );
                      }).toList())),
            )),
        body: TabBarView(
            controller: _tabController,
            children: welfaredataList.map((v) {
              return TabPage(v.value);
            }).toList()));
  }
}

// ignore: must_be_immutable
class TabPage extends StatefulWidget {
  String url;

  TabPage(this.url);

  @override
  _TabPageState createState() => new _TabPageState(this.url);
}

class _TabPageState extends State<TabPage> with AutomaticKeepAliveClientMixin {
  String url;
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  _TabPageState(this.url);

  //是否保存状态
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        });
  }
}
