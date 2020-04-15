import 'package:flutter_neweducation/home/modle/banner_data_entity.dart';

import 'net/baseresponse_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerDataEntity") {
      return BannerDataEntity.fromJson(json) as T;
    } else if (T.toString() == "BaseResponseEntity") {
      return BaseResponseEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}