import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_app/layout/page_view/shop_page_view.dart';

void main() {
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
