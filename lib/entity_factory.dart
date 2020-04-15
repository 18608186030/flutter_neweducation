import 'package:flutter_neweducation/home/modle/banner_data_entity.dart';
import 'package:flutter_neweducation/home/modle/welfaredata_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerDataEntity") {
      return BannerDataEntity.fromJson(json) as T;
    } else if (T.toString() == "WelfaredataEntity") {
      return WelfaredataEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}