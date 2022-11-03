

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/layout/login/login_screen.dart';
import 'package:shop_app/layout/page_view/shop_page_view.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_cubit.dart';
import 'package:shop_app/layout/shop_layout/shop_layout.dart';
import 'package:shop_app/network/remote/cache_helper.dart';

import 'package:shop_app/network/remote/dio_helper.dart';
import 'package:shop_app/network/shared/bloc_observer.dart';

import 'componnent/reusable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  var widget;
  bool? onBoarding = CacheHelper.getData(key: 'OnBoarding');
  token = CacheHelper.getData(key: 'Token');
  print(onBoarding);
  print(token);
  if (onBoarding != null) {
    if (token != null) {
      widget = ShopLayout();
    } else
      (widget = LogIn());
  } else {
    widget = MyPageView();
  }
  Bloc.observer = MyBlocObserver();
  ErrorWidget.builder = (FlutterErrorDetails details) => Material(
        color: Colors.green.shade200,
        child: Center(
          child: Text(
            details.exception.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      );
  AppDio.init();
  runApp(MyApp(
    token: token ?? "",
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  final String token;

  MyApp({required this.token, required this.widget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopLayoutCubit>(
          create: (BuildContext context) => ShopLayoutCubit()..getHomeData(),
        ),

      ],
      child:  MaterialApp(
        home: widget,
       theme: ThemeData(
         scaffoldBackgroundColor: Colors.white,
           appBarTheme:  AppBarTheme(backgroundColor: Colors.white,elevation: 0.0)),
      ),
    );
  }
}
