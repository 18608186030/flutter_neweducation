import '../../entity_factory.dart';

class BaseListEntity<T> {
  String code;
  String msg;
  List<T> data;

  BaseListEntity({this.code, this.msg, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData = new List<T>();
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      (json['data'] as List).forEach((v) {
        mData.add(EntityFactory.generateOBJ<T>(v));
      });
    }
    return BaseListEntity(
      code: json["code"],
      msg: json["msg"],
      data: mData,
    );
  }
}
