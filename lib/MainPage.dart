import 'package:flutter/material.dart';
import 'package:flutter_neweducation/utils/image_util.dart';
import 'package:flutter_neweducation/welfare/WelfarePage.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'find/FindPage.dart';
import 'home/HomePage.dart';
import 'my/MyPage.dart';

//主页界面
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
    ScreenUtil.init(designSize: Size(750, 1334), allowFontScaling: false);
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new MainPageWidget());
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['学习', '福利', '发现', '我的'];
  var _pageList;

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  void initData() {
    tabImages = [
      [
        getTabImage(ImageUtil.getImagePath('ic_home_normal')),
        getTabImage(ImageUtil.getImagePath('ic_home_pressed'))
      ],
      [
        getTabImage(ImageUtil.getImagePath('ic_welfare_normal')),
        getTabImage(ImageUtil.getImagePath('ic_welfare_pressed'))
      ],
      [
        getTabImage(ImageUtil.getImagePath('ic_find_normal')),
        getTabImage(ImageUtil.getImagePath('ic_find_pressed'))
      ],
      [
        getTabImage(ImageUtil.getImagePath('ic_my_normal')),
        getTabImage(ImageUtil.getImagePath('ic_my_pressed'))
      ]
    ];
    _pageList = [
      new HomePage(),
      new WelfarePage(),
      new FindPage(),
      new MyPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
        body: IndexedStack(
          index: _tabIndex,
          children: _pageList,
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _tabIndex,
          iconSize: 24.0,
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ));
  }
}
