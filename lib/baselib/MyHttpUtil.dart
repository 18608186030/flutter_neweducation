import 'package:dio/dio.dart';

import 'RequestListener.dart';
import 'baseresponse_entity.dart';

///网络请求工具类，单例处理
class MyHttpUtil {
  static const String _GET = "get";
  static const String _POST = "post";
  static const int _COMMON_REQUEST_ERROR = -1;
  static const String baseUrl = "http://es.staq360.com/";
  Dio _dio;
  static MyHttpUtil _instance;

  static MyHttpUtil get instance => _getInstance();

  factory MyHttpUtil() => _getInstance();

  static MyHttpUtil _getInstance() {
    if (_instance == null) {
      _instance = MyHttpUtil._internal();
    }
    return _instance;
  }

  ///初始化
  MyHttpUtil._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl, //项目域名，如果传的 url 是以 http 开头的会忽略此域名
      //请求头 headers: {'platform': 'android', 'version': 11.0},
      connectTimeout: 30000,
      receiveTimeout: 30000,
    ));
    _addStartHttpInterceptor(_dio); //添加请求之前的拦截器
  }

  ///get请求
  get(String url, RequestListener requestListener,
      {data, queryParameters}) async {
    _requestHttp(url, requestListener, _GET, data, queryParameters);
  }

  ///post请求
  post(String url, RequestListener requestListener,
      {data, queryParameters}) async {
    _requestHttp(url, requestListener, _POST, data, queryParameters);
  }

  ///网络请求
  _requestHttp(String url, RequestListener requestListener,
      [String method, Map<String, dynamic> queryParameters, data]) async {
    try {
      Response<Map<String, dynamic>> response;
      if (method == _GET) {
        if (queryParameters != null) {
          response = await _dio.get<Map<String, dynamic>>(url,
              queryParameters: queryParameters);
        } else {
          response = await _dio.get<Map<String, dynamic>>(url);
        }
      } else if (method == _POST) {
        if (data != null && queryParameters != null) {
          response = await _dio.post<Map<String, dynamic>>(url,
              data: data, queryParameters: queryParameters);
        } else {
          if (data != null) {
            response = await _dio.post<Map<String, dynamic>>(url, data: data);
          } else if (queryParameters != null) {
            response = await _dio.post<Map<String, dynamic>>(url,
                queryParameters: queryParameters);
          } else {
            response = await _dio.post<Map<String, dynamic>>(url);
          }
        }
      }

      if (response.statusCode != 200) {
        requestListener.onError(
            BaseResponseEntity(response.statusCode.toString(), "请求失败", Map()));
        return;
      }
      BaseResponseEntity baseResponse =
          BaseResponseEntity.fromJson(response.data);
      if (baseResponse.data == null) baseResponse.data = Map();
      if (baseResponse.code == "200") {
        requestListener.onSuccess(baseResponse);
      } else {
        requestListener.onError(baseResponse);
      }
    } catch (exception) {
      requestListener.onError(
          BaseResponseEntity(_COMMON_REQUEST_ERROR.toString(), "请求失败", Map()));
    }
  }

  ///拦截处理
  _addStartHttpInterceptor(Dio dio) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options; // 在请求被发送之前做一些事情
    }, onResponse: (Response response) {
      return response; // 在返回响应数据之前做一些预处理
    }, onError: (DioError e) {
      return e; // 当请求失败时做一些预处理
    }));
  }
}
