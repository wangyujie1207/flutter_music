import 'package:dio/dio.dart';

class HttpRequest {
  static Dio dio;
  BaseOptions options;

  HttpRequest([BaseOptions baseOptions]) {
    if (baseOptions == null) {
      baseOptions = BaseOptions(
          baseUrl: 'http://192.168.0.103:3000',
//          baseUrl: 'http://192.168.1.116:3000',
//          baseUrl: 'http://wangyujie.vaiwan.com',
          connectTimeout: 5000,
          receiveTimeout: 3000);
    }
    this.options = baseOptions;
    dio = Dio(options);
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      return options;
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) {
      print('请求发生错误=============== $e');
      return e;
    }));
  }

  //GET请求
  Future get(String path,
      {queryParameters, Options options, CancelToken cancelToken}) async {
    return await dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }
}

HttpRequest httpRequest = new HttpRequest();