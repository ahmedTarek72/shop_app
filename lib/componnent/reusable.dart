import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/on_boarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
var pageController = PageController();
List<OnBoardingModel> boarding =[
 OnBoardingModel(title: "Title 1", body: "body1"),
  OnBoardingModel(title: "title2", body: "body2"),
  OnBoardingModel(title: "title3", body: "body3")
];
