import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/login/login_screen.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_cubit.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_state.dart';
import 'package:shop_app/network/remote/cache_helper.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
  listener: (context, state) {

  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(),
      body: ShopLayoutCubit.get(context).Screens[ShopLayoutCubit.get(context).currentIndex],
      bottomNavigationBar: BottomNavigationBar(



        currentIndex:   ShopLayoutCubit.get(context).currentIndex,


        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.deepOrange,
        type: BottomNavigationBarType.fixed,


        onTap: (index) {
         ShopLayoutCubit.get(context).changeBottomNavBar(index);
        },


        items: [
        BottomNavigationBarItem(icon: Icon( Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon( Icons.category_outlined),label: "Categories"),
        BottomNavigationBarItem(icon: Icon( Icons.favorite),label: "Favourite"),
        BottomNavigationBarItem(icon: Icon( Icons.settings),label: "Settings"),

      ],),
    );
  },
);
  }
}
