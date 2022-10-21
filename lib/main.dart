import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/layout/login/login_screen.dart';
import 'package:shop_app/layout/page_view/shop_page_view.dart';
import 'package:shop_app/network/remote/cache_helper.dart';

import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/network/shared/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await CacheHelper.init();
 var onBoarding = CacheHelper().getData(key: 'OnBoarding');
 print(onBoarding);


  Bloc.observer = MyBlocObserver();
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(color: Colors.green.shade200,
  child: Center(
    child: Text(details.exception.toString(),
    style: const TextStyle(color: Colors.white,
    fontWeight: FontWeight.bold,fontSize: 20),),

  ),
  );
  AppDio.init();
  runApp( MyApp(onBoarding: onBoarding,

  ));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;

  MyApp({required this.onBoarding});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConditionalBuilder(
        condition: onBoarding == true ,
        fallback: (context) => MyPageView(),
        builder: (context) => LogIn(),

      ),
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
