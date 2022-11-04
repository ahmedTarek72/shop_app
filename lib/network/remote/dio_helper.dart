import 'package:dio/dio.dart';

class AppDio {
  static Dio? dio;
  static void init() {
    dio = Dio(BaseOptions(

      baseUrl: "https://student.valuxapps.com/api/",
      receiveDataWhenStatusError: true,
      headers: {

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
      "Content-Type":"application/json",
      "lang":"ar",
      "Authorization":token??"",

    };

   return  await dio?.post(url,queryParameters: query,data: data);
  }
  static Future<Response?> getData({
  required String url,
     String? token ,
    String lang = "en",
     Map<String,dynamic>? query,

}) async{
    dio?.options.headers ={
      "Content-Type":"application/json",
      "lang":lang,
      "Authorization":token??"",

    };
    return  await dio?.get(url,queryParameters: query);
  }
}
