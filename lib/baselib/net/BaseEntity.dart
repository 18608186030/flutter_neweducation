import '../../entity_factory.dart';

class BaseEntity<T> {
  String code;
  String msg;
  T data;

  BaseEntity({this.code, this.msg, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
      code: json["code"],
      msg: json["msg"],
      data: EntityFactory.generateOBJ<T>(json["data"]),
    );
  }
}
