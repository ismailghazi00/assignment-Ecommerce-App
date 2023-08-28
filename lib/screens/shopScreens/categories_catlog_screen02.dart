// import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../modules/product_class.dart';
import 'package:http/http.dart' as http;

import '../../widgets/item_tile02.dart';

class CategotiesCatalogScreen extends StatefulWidget {
  String catagegoryID;
  CategotiesCatalogScreen({super.key, required this.catagegoryID});

  @override
  State<CategotiesCatalogScreen> createState() =>
      _CategotiesCatalogScreenState();
}

class _CategotiesCatalogScreenState extends State<CategotiesCatalogScreen> {
  void setTheState() {
    return setState(() {});
  }

  Categories? categoryList;
  Product? product;
  @override
  void initState() {
    widget.catagegoryID == 'all'
        ? getallProduct()
        : getproductDynimicw(widget.catagegoryID);
    getCategoriesList();

    super.initState();
  }

  Future<void> getproductDynimicw(String iD) async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/get/category/$iD'));
    setState(() {
      product = Product.fromJson(jsonDecode(newResponse.body));
    });
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
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        child: Text(
            widget.catagegoryID == 'all'
                ? 'All products'
                : product?.products?[0].category?.name ?? 'loading',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 34, fontWeight: FontWeight.w700, height: 0)),
      ),
      const SizedBox(height: 10),
      Row(children: [
        const Spacer(),
        const Icon(Icons.swap_vert_outlined),
        Text('Price: lowest to high',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: 20),
      ]),
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
                            onPressed: () {
                              getproductDynimicw(
                                  "${categoryList?.categories?[index].id}");
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              // fixedSize: const Size(100, 30), //if i hide the fixed size button will take as musch spae as its needs
                            ),
                            child: Text(
                                categoryList?.categories?[index].name ??
                                    'loading',
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
      product?.products == null
          ? Center(
              child: SizedBox(
                width: 200,
                height: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    Flexible(
                        child: Lottie.asset('assets/task.json',
                            height: 100, fit: BoxFit.fill)),
                  ],
                ),
              ),
            )
          : Expanded(
              child: ListView.builder(
                  itemCount: product?.products?.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        TileWidget02(
                          product: product,
                          index: index,
                          setTheState: setTheState,
                        ),
                      ],
                    );
                  })))
    ]));
  }
}
