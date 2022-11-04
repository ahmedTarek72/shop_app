

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_cubit.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_state.dart';
import 'package:shop_app/models/HomeModel.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return ConditionalBuilder(condition: ShopLayoutCubit.get(context).homeModel != null,
            builder: (context) => Scaffold(
              appBar: AppBar(


                title: Text("salla", style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),),
                actions: [
                  IconButton(onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.black,)),
                ],
              ),
                body:productBuilder(ShopLayoutCubit.get(context).homeModel ),
            ),
            fallback:(context) => Center(child: CircularProgressIndicator()),);
      },
    );
  }
  Widget productBuilder(HomeModel? model) {
    return Container(
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          initialPage: 2,
          autoPlay: true,
        ),
        items: model?.data?.banners?.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return CachedNetworkImage(
                imageUrl: i.image?? "",
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),

              );
            },
          );
        }).toList(),
      ),
    );
}
}
