import 'package:json_annotation/json_annotation.dart';

///返回对象封装
@JsonSerializable()
class BaseResponse {
  BaseResponse(this.code, this.msg, this.data, this.success);

  int code;
  String msg;
  Map<String, dynamic> data;
  bool success;

  BaseResponse.fromJson(Map<String, dynamic> json)
      : this.code = json['code'],
        this.msg = json['msg'],
        this.data = json['data'],
        this.success = json['success'];

  Map<String, dynamic> toJson() => {'code': code, 'msg': code, 'data': data, 'success': success};
}
