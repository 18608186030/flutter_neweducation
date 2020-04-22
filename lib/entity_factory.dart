import 'package:flutter_neweducation/home/modle/banner_data_entity.dart';
import 'package:flutter_neweducation/welfare/welfaredata_entity.dart';
import 'package:flutter_neweducation/baselib/net/ErrorEntity.dart';
import 'package:flutter_neweducation/find/modle/find_short_video_data_entity.dart';
import 'package:flutter_neweducation/find/modle/find_information_data_entity_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerDataEntity") {
      return BannerDataEntity.fromJson(json) as T;
    } else if (T.toString() == "WelfaredataEntity") {
      return WelfaredataEntity.fromJson(json) as T;
    } else if (T.toString() == "FindShortVideoDataEntity") {
      return FindShortVideoDataEntity.fromJson(json) as T;
    } else if (T.toString() == "FindInformationDataEntityEntity") {
      return FindInformationDataEntityEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}