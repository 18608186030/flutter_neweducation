import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neweducation/baselib/MyHttpUtil.dart';
import 'package:flutter_neweducation/baselib/RequestListener.dart';
import 'package:flutter_neweducation/baselib/api.dart';
import 'package:flutter_neweducation/baselib/baseresponse_entity.dart';
import 'package:flutter_neweducation/welfare/welfaredata_entity.dart';


import 'package:webview_flutter/webview_flutter.dart';


//福利界面
class WelfarePage extends StatefulWidget {
  _WelfarePageState createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage>
    with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin {
  List<WelfaredataList> welfaredataList = List<WelfaredataList>();
  TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  void initState() {
    super.initState();
    welfaredataList.add(WelfaredataList(name:"货运通",value: "http://192.168.8.9"));
    welfaredataList.add(WelfaredataList(name:"E钱包",value: "http://es.staq360.com/icbch5"));

    _tabController = TabController(
      length: welfaredataList.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    MyHttpUtil.instance.get(
        Api.WELFARE_MENU_LIST,
        RequestListener(
            onSuccessListener: (BaseResponseEntity data) {
              WelfaredataEntity bannerDataEntity =
                  WelfaredataEntity.fromJson(data.data);
              setState(() {
                welfaredataList = bannerDataEntity.xList;
                _tabController = TabController(
                  length: welfaredataList.length,
                  vsync: this,
                );
              });
            },
            onErrorListener: (BaseResponseEntity errorData) {}));
    return Scaffold(
        appBar: new AppBar(
            title: Center(
                child: new TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    tabs: welfaredataList.map((v) {
                      return Center(
                        child: new Text(v.name),
                      );
                    }).toList()))),
        body: TabBarView(
            controller: _tabController,
            children: welfaredataList.map((v) {
              return Center(
                child: TabPage(v.value),
              );
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
