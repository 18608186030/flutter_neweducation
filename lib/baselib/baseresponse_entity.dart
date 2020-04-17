///返回对象封装
class BaseResponseEntity {
  BaseResponseEntity(this.code, this.msg, this.data);

  String code;
  String msg;
  Map<String, dynamic> data;

  BaseResponseEntity.fromJson(Map<String, dynamic> json)
      : this.code = json['code'],
        this.msg = json['msg'],
        this.data = json['data'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}
