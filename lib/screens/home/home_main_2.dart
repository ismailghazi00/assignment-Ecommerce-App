import 'dart:convert';

import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import '../../modules/product_class.dart';
import '../../widgets/item_tile01.dart';
import 'package:http/http.dart' as http;

import '../shopScreens/categories_list_screen01.dart';

class HomeMain02 extends StatefulWidget {
  const HomeMain02({super.key});
  @override
  State<HomeMain02> createState() => _HomeMain02State();
}

String tempImage = 'assets/girlCoverPicture.jpg';

class _HomeMain02State extends State<HomeMain02> {
  void setTheState() {
    setState(() {});
  }

  Product? newProduct;
  Product? saleProduct;
  @override
  void initState() {
    getProductNew();
    getProductSale();
    super.initState();
  }

  Future<void> getProductNew() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/new/getAll'));
    setState(() {
      newProduct = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  Future<void> getProductSale() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/sale/getAll'));
    setState(() {
      saleProduct = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 196,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage('assets/girlcover02.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.darken))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Street clothes',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                height: 0)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoriesList()));
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 36),
                            shadowColor: Theme.of(context).colorScheme.primary,
                            elevation: 8, //Shadow radius
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text('Check Categories',
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ]),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
              height: 337,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Row(children: [
                    const SizedBox(width: 15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sale',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const SizedBox(height: 2),
                          Text('Super summer sale',
                              style: Theme.of(context).textTheme.titleSmall),
                        ]),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesList()));
                      },
                      child: Text('View all',
                          style: Theme.of(context).textTheme.titleSmall),
                    )
                  ]),
                  const SizedBox(height: 5),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return TileWidget01(
                            index: index,
                            product: saleProduct,
                            setTheState: setTheState,
                          );

                          // showItemsTile();
                        }),
                        itemCount: saleProduct?.products?.length,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics()),
                  )
                ]),
              )),
          const SizedBox(height: 20),
          SizedBox(
              height: 331,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Row(children: [
                    const SizedBox(width: 15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text('You’ve never seen it before!',
                              style: Theme.of(context).textTheme.titleSmall),
                        ]),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoriesList()));
                      },
                      child: Text('View all',
                          style: Theme.of(context).textTheme.titleSmall),
                    )
                  ]),
                  const SizedBox(height: 3),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return TileWidget01(
                            index: index,
                            product: newProduct,
                            setTheState: setTheState,
                          );
                        }),
                        itemCount: newProduct?.products?.length,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics()),
                  )
                ]),
              )),
        ],
      ),
    ));
  }
}
