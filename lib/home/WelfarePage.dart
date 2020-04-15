import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_neweducation/net/baseresponse_entity.dart';
import 'package:flutter_neweducation/net/MyHttpUtil.dart';
import 'package:flutter_neweducation/net/RequestListener.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'modle/welfaredata_entity.dart';

//福利界面
class WelfarePage extends StatefulWidget {
  _WelfarePageState createState() => _WelfarePageState();
}

class _WelfarePageState extends State<WelfarePage>
    with SingleTickerProviderStateMixin {
  List<WelfaredataList> welfaredataList = List<WelfaredataList>();
  TabController _tabController;

  @override
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabDemo'),
        bottom: TabBar(
          isScrollable: true,
          //是否可以滚动
          controller: _tabController,
          labelColor: Colors.red,
          unselectedLabelColor: Color(0xff666666),
          labelStyle: TextStyle(fontSize: 16.0),
          tabs: welfaredataList.map((item) {
            return Tab(
              text: item.name,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: welfaredataList.map((item) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: TabPage(item.value),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  _sendGetRequest() {
    MyHttpUtil.instance.get(
        "admin/public/sys/dict/type/WELFARE_MENU_CONFIG",
        RequestListener(
            onSuccessListener: (BaseResponseEntity data) {
              WelfaredataEntity bannerDataEntity =
              WelfaredataEntity.fromJson(data.data);
              setState(() {
                welfaredataList = bannerDataEntity.xList;
              });
            },
            onErrorListener: (BaseResponseEntity errorData) {}));
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
