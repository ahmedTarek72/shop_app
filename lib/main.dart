import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/layout/page_view/shop_page_view.dart';
import 'package:shop_app/network/remote/dio_helper.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(color: Colors.green.shade200,
  child: Center(
    child: Text(details.exception.toString(),
    style: const TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold,fontSize: 20),),

  ),
  );
  AppDio.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPageView(),
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0.0,
            backgroundColor: Colors.white,
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.white),
          ),
          fontFamily: "Jannah"),
    );
  }
}
