

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/layout/categories/categories_screen.dart';
import 'package:shop_app/layout/favourites/favourites_secreen.dart';
import 'package:shop_app/layout/products/products_screen.dart';
import 'package:shop_app/layout/settings/settings_screen.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_state.dart';

import 'package:shop_app/layout/shop_layout/shop_layout.dart';

import 'package:shop_app/models/loginModel/HomeModel.dart';
import 'package:shop_app/models/on_boarding_model.dart';
import 'package:shop_app/network/end_points.dart';
import 'package:shop_app/network/remote/cache_helper.dart';
import 'package:shop_app/network/remote/dio_helper.dart';



class ShopLayoutCubit extends Cubit<ShopLayoutStates>  {
  ShopLayoutCubit() : super(ShopLayoutInitial());
static  ShopLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeBottomNavBar( int index){
    currentIndex = index ;
    emit(ChangeBotttomNavBarState());
  }
  List<Widget> Screens = [

    ProductsScreen(),
    CategoriesScreen(),

    FavouritesScreen(),
    SettingsScreen(),

  ];
   HomeModel homeModel =  HomeModel();


void getHomeData(

){
  emit(GetHomeLoadingState());
  AppDio.getData(url: Home).then((value) {
    emit(GetHomeSuccessState());
    homeModel = HomeModel.fromJson(value?.data);

    }).catchError((error){
    emit( GetHomeErrorState());
    print(error.toString());
    });


}


}

