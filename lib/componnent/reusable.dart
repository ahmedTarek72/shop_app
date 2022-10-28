import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shop_app/models/on_boarding_model.dart';

import '../layout/login/login_screen.dart';
import '../network/remote/cache_helper.dart';
 void showToast ({
 required String text,
  required ToastStates color,
}) =>  Fluttertoast.showToast(
     msg: text,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     backgroundColor: setToastColor(color),
     textColor: Colors.white,
     fontSize: 16.0
 );
 enum ToastStates { Error,Warning,Success}
Color setToastColor(ToastStates color) {
 Color c;

 switch (color) {
  case ToastStates.Error:
   c = Colors.red;
   break;
  case ToastStates.Success:
   c = Colors.green;
   break;
  case ToastStates.Warning:
   c = Colors.amber;
   break;
 }

 return c;
}


var pageController = PageController();
List<OnBoardingModel> boarding =[
 OnBoardingModel(title: "Title 1", body: "body1"),
  OnBoardingModel(title: "title2", body: "body2"),
  OnBoardingModel(title: "title3", body: "body3")
];
void logOut(context){
 {
  CacheHelper.clearData(key: 'Token').then((value) {
   if (value == true) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
         builder: (context) => LogIn(),
        ),
            (route) => false);
   }
  });
 }
}