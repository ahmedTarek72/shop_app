import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_cubit.dart';
import 'package:shop_app/layout/shop_layout/cubit/shop_layout_state.dart';

import 'package:shop_app/models/loginModel/HomeModel.dart';
import 'package:shop_app/network/end_points.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: ShopLayoutCubit.get(context).homeModel != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text(
                "salla",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ],
            ),
            body: productBuilder(ShopLayoutCubit.get(context).homeModel),
            backgroundColor: Colors.grey[300],
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget productBuilder(
    HomeModel model,
  ) {
    return Column(

      children: [
        Container(
          color: Colors.grey,
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 0,
              height: 250.0,
              disableCenter: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              reverse: false,
              autoPlay: true,
            ),
            items: model.data.banners.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedNetworkImage(
                    width: 400,
                    height: 300,
                    imageUrl: i.image,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,

              mainAxisSpacing: 10,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1 / 1.8,

              children: List.generate(model.data.products.length, (index) {
                return buildProductItem(model.data.products[index]) ;
              }),
            ),
          ),
        ),
      ],
    );
  }
  Widget buildProductItem( model) => Column(

    children: [
      Image(
        width: double.infinity,
        fit: BoxFit.fill,
        height: 240,
        image: NetworkImage(
         model.image,
        ),
      ),
      Text(
        (model.description),
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            height: 1.2),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      Row(
        children: [
          Text(
            (model.price.toString()),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.blue,
                height: 1.3),
          ),
          const Spacer(),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
              )),
        ],
      ),
    ],
  );
}
