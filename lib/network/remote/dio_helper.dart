import 'package:dio/dio.dart';

class AppDio {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(

      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
      headers: {

        "Content-Type":"application/json",
      },
    ));
  }

  static Future<Response?> postData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    dio?.options.headers ={
      "lang":"ar",
      "Authorization":token??"",

    };

   return dio?.post(url,queryParameters: query,data: data);
  }
}
