import 'package:dio/dio.dart';

class RespX {
  Map<String, dynamic> data;
  int errorCode;
  String errorMsg;

  RespX({this.data, this.errorCode, this.errorMsg});

  RespX.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}

class HttpX {
  static Dio _dio;

  static Dio dio() {
    if (_dio == null) {
      _dio = Dio(BaseOptions(
        baseUrl: "https://www.wanandroid.com/",
        connectTimeout: 5000,
        receiveTimeout: 3000,
      ));
    }
    return _dio;
  }

  static Future<RespX> get(String path,
          {Map<String, dynamic> queryParameters, Options options}) => dio()
          .get(path, queryParameters: queryParameters, options: options)
          .then((value) {
        try {
          print('HttpX ---------> ');
          print('url ===> $path');
          print('resp ===> ${value.data}');
          print('HttpX <--------- ');
          return value.data == null ? null : RespX.fromJson(value.data);
        } catch (e) {
          return Future.error(e);
        }
      });

  static Future<RespX> post(String path,
          {data, Map<String, dynamic> queryParameters, Options options}) => dio()
          .post(path, data: data, queryParameters: queryParameters, options: options)
          .then((value) {
              try {
                print('HttpX ---------> ');
                print('url ===> $path');
                print('resp ===> ${value.data}');
                print('HttpX <--------- ');
                return value.data == null ? null : RespX.fromJson(value.data);
              } catch (e) {
                return Future.error(e);
              }
            });
}
