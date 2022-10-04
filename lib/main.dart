import 'package:flutter/material.dart';
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


      home:MyPageView(),
      theme: ThemeData(
          fontFamily: "Jannah"
      ),
    );
  }
}


