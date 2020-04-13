import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//首页界面
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const List<String> images = [
  "https://www.baidu.com/img/bd_logo1.png",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586771363658&di=6bf26f13be246940e4cb9cee825c1750&imgtype=0&src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20190928%2F19%2F1569669941-mbktUvcAEW.jpg",
  "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586771363658&di=7f6d0c3795592c7f71a8a5fd25535277&imgtype=0&src=http%3A%2F%2Fimage.biaobaiju.com%2Fuploads%2F20180802%2F00%2F1533141975-YiJkWSvejO.jpeg"
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("首页"),
        ),
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              images[index],
              fit: BoxFit.fill,
            );
          },
          autoplay: true,
          itemCount: images.length,
          pagination: new SwiperPagination(),
        ));
  }
}
