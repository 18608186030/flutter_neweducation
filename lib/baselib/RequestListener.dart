import 'package:flutter/material.dart';

import 'baseresponse_entity.dart';

///网络请求监听
class RequestListener {
  RequestListener({@required this.onSuccessListener, @required this.onErrorListener});

  //请求成功
  final ValueChanged<BaseResponseEntity> onSuccessListener;

  //请求失败
  final ValueChanged<BaseResponseEntity> onErrorListener;

  void onSuccess(BaseResponseEntity response) {
    if (onSuccessListener != null) onSuccessListener(response);
  }

  void onError(BaseResponseEntity response) {
    if (onErrorListener != null) onErrorListener(response);
  }
}
