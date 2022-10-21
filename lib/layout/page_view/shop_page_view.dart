import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shop_app/componnent/reusable.dart';
import 'package:shop_app/layout/login/login_screen.dart';
import 'package:shop_app/models/on_boarding_model.dart';
import 'package:shop_app/network/remote/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

bool isLast = false;

class MyPageView extends StatefulWidget {
  MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
              onPressed: () {
              CacheHelper.setPrefs(key: "OnBoarding", value: true).then((value) {
                if (value == true){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogIn(),
                      ),
                          (route) => false);
                }
              });
              },
              child: Text(
                "SKIP",
                style: TextStyle(color: Colors.deepOrange),
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: PageView.builder(
        onPageChanged: (value) {
          if (value == boarding.length - 1) {
            setState(() {
              isLast = true;
            });
          } else {
            setState(() {
              isLast = false;
            });
          }
        },
        controller: pageController,
        physics: BouncingScrollPhysics(),
        itemCount: boarding.length,
        itemBuilder: (context, index) =>
            buildOnBoardingScreen(boarding[index], context),
      ),
    );
  }
}

Widget buildOnBoardingScreen(OnBoardingModel model, context) {
  return Padding(
    padding: EdgeInsets.all(30),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(child: Image.asset("assets/images/onboard_1.jpg")),
        SizedBox(height: 20.0),
        Text(model.title,
            style: TextStyle(
              fontFamily: "Jannah",
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 20.0,
        ),
        Text(model.body),
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                    spacing: 5,
                    activeDotColor: Colors.deepOrange),
                controller: pageController,
                count: boarding.length),
            Spacer(),
            FloatingActionButton(
                child: Icon(Icons.arrow_forward_ios),
                backgroundColor: Colors.deepOrange,
                onPressed: () {
                  if (isLast) {
                    CacheHelper.setPrefs(key: "OnBoarding", value: true).then((value) {
                      if (value == true){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LogIn(),
                            ),
                                (route) => false);
                      }
                    });
                  } else {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.fastLinearToSlowEaseIn);
                  }
                }),
          ],
        ),
      ],
    ),
  );
}
