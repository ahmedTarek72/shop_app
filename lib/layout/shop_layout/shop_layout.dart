import 'package:flutter/material.dart';
import 'package:shop_app/layout/login/login_screen.dart';
import 'package:shop_app/network/remote/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TextButton(
          onPressed: (() {
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
          }),
          child: Text("clear")),
    );
  }
}
