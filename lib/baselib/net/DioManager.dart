import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_neweducation/baselib/net/api.dart';
import 'BaseEntity.dart';
import 'BaseListEntity.dart';
import 'ErrorEntity.dart';
import 'NetMethod.dart';

class DioManager {
  ///单例模式
  Dio dio;
  BaseOptions options;
  CancelToken cancelToken = CancelToken();

  static DioManager _instance;

  static DioManager get instance => _getInstance();

  factory DioManager() => _getInstance();

  static DioManager _getInstance() {
    if (_instance == null) {
      _instance = DioManager._internal();
    }
    return _instance;
  }

  ///初始化
  DioManager._internal() {
    //BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    options = BaseOptions(
      //请求基地址,可以包含子路径
      baseUrl: Api.BASE_URL,
      //连接服务器超时时间，单位是毫秒.
      connectTimeout: 30000,
      //响应流上前后两次接受到数据的间隔，单位为毫秒。
      receiveTimeout: 30000,
      //Http请求头.
      headers: {
        //do something
        //"version": "1.0.0"
      },
      //请求的Content-Type，默认值是"application/json; charset=utf-8",Headers.formUrlEncodedContentType会自动编码请求体.
      //contentType: Headers.formUrlEncodedContentType,
      contentType: Headers.jsonContentType,
      //表示期望以那种格式(方式)接受响应数据。接受四种类型 `json`, `stream`, `plain`, `bytes`. 默认值是 `json`,
      responseType: ResponseType.plain,
    );
    dio = Dio(options);
    //Cookie管理
    dio.interceptors.add(CookieManager(CookieJar()));
    //添加拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) {
      return e;
    }));
  }

  // 请求，返回参数为 T
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future request<T>(NetMethod method, String path,
      {Map<String, dynamic> params,
      data,
      Function(T) success,
      Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request<Map<String, dynamic>>(path,
          queryParameters: params,
          data: data,
          options: Options(method: NetMethodValues[method]));
      if (response != null) {
        try {
          BaseEntity entity = BaseEntity<T>.fromJson(response.data);
          if (entity.code == "200") {
            success(entity.data);
          } else {
            error(
                ErrorEntity(code: int.parse(entity.code), message: entity.msg));
          }
        } catch (e) {
          error(ErrorEntity(code: -1, message: "数据解析错误"));
        }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  // 请求，返回参数为 List<T>
  // method：请求方法，NWMethod.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future requestList<T>(NetMethod method, String path,
      {Map<String, dynamic> params,
      data,
      Function(List<T>) success,
      Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.request<Map<String, dynamic>>(path,
          queryParameters: params,
          data: data,
          options: Options(method: NetMethodValues[method]));
      if (response != null) {
        try {
          BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
          if (entity.code == "200") {
            success(entity.data);
          } else {
            error(
                ErrorEntity(code: int.parse(entity.code), message: entity.msg));
          }
        } catch (e) {
          error(ErrorEntity(code: -1, message: "数据解析错误"));
        }
      } else {
        error(ErrorEntity(code: -1, message: "未知错误"));
      }
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  Future down<T>(urlPath, savePath,
      {Map<String, dynamic> params,
      Function(List<T>) success,
      Function(ErrorEntity) error}) async {
    try {
      Response response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
      });
    } on DioError catch (e) {
      error(createErrorEntity(e));
    }
  }

  // 错误信息
  // ignore: missing_return
  ErrorEntity createErrorEntity(DioError error) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        {
          return ErrorEntity(code: -1, message: "请求取消");
        }
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "连接超时");
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "请求超时");
        }
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        {
          return ErrorEntity(code: -1, message: "响应超时");
        }
        break;
      case DioErrorType.RESPONSE:
        {
          int errCode = error.response.statusCode;
          String errMsg = error.response.statusMessage;
          return ErrorEntity(code: errCode, message: errMsg);
        }
        break;
      case DioErrorType.DEFAULT:
        break;
    }
  }

  /*
   * 取消请求
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }
}
