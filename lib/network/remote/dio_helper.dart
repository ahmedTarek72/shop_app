import 'package:dio/dio.dart';

class AppDio {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(

      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
      headers: {
        "lang":"ar",
        "Content-Type":"application/json",
      },
    ));
  }

  static Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
   return dio?.post(url,queryParameters: query,data: data);
  }
}
