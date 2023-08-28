// import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'dart:convert';

import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../modules/product_class.dart';
import 'package:http/http.dart' as http;

import '../widgets/fav_tile.dart';
import '../widgets/item_tile02.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void setTheState() {
    return setState(() {});
  }

  Categories? categoryList;
  Product? product;
  @override
  void initState() {
    getCategoriesList();
    getallProduct();
    super.initState();
  }

  Future<void> getallProduct() async {
    http.Response newResponse = await http
        .get(Uri.parse('https://ecommerce.salmanbediya.com/products/getAll'));
    setState(() {
      product = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  Future<void> getCategoriesList() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/category/getAll'));
    setState(() {
      categoryList = Categories.fromJson(jsonDecode(newResponse.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 20),
      Row(children: [
        //------------------Back Button
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 18)),
        const Spacer(),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.search, size: 18)),
      ]),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text('Favorites',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 34, fontWeight: FontWeight.w700, height: 0)),
      ),
      const SizedBox(height: 10),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
            height: 30,
            child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList?.categories?.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: ElevatedButton(
                            //----------------------Categories Buttons
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              // fixedSize: const Size(100, 30), //if i hide the fixed size button will take as musch spae as its needs
                            ),
                            child: Text(
                                categoryList?.categories?[index].name ??
                                    'Loding',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary))),
                      );
                    })))),
      ),
      const SizedBox(height: 15),
      Row(children: [
        const Spacer(),
        const Icon(Icons.swap_vert_outlined),
        Text('Price: lowest to high',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: 20),
      ]),
      favModule.ProductList.isEmpty
          ? Center(
              child: SizedBox(
                width: 343,
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_rounded,
                      size: 80,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    const SizedBox(height: 30),
                    Text("Please add Products to Favorites!!",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 20)),
                  ],
                ),
              ),
            )
          : Center(
              child: SizedBox(
                width: 345,
                height: 450,
                child: Expanded(
                    child: ListView.builder(
                        itemCount: favModule.ProductList.length,
                        itemBuilder: ((context, index) {
                          return FavoritesProductTile(
                            favModule: favModule,
                            index: index,
                          );
                        }))),
              ),
            )
    ]);
  }
}
