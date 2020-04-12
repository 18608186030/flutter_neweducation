import 'package:json_annotation/json_annotation.dart';

///返回对象封装
@JsonSerializable()
class BaseResponse {
  BaseResponse(this.code, this.msg, this.data);
  String code;
  String msg;
  Map<String, dynamic> data;
  BaseResponse.fromJson(Map<String, dynamic> json)
      : this.code = json['code'],
        this.msg = json['msg'],
        this.data = json['data'];
  Map<String, dynamic> toJson() => {'code': code, 'msg': code, 'data': data};
}
