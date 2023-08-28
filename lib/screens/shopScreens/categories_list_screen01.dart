import 'dart:convert';

import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../modules/product_class.dart';
import 'categories_catlog_screen02.dart';
import 'package:http/http.dart' as http;

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  String catagegoryID = 'all';
  Categories? categoryList;
  @override
  void initState() {
    getCategoriesList();
    super.initState();
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          //------------------Back Button
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 18)),
          const Spacer(),
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.search, size: 18)),
        ]),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategotiesCatalogScreen(
                              catagegoryID: catagegoryID,
                            )));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(343, 48),
                  shadowColor: Theme.of(context).colorScheme.primary,
                  elevation: 8, //Shadow radius
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Text('VIEW ALL ITEMS',
                  style: Theme.of(context).textTheme.bodyMedium)),
        ),
        const SizedBox(height: 15),
        Text('Choose category', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return
                // categoryList == null
                //     ? Lottie.asset('assets/Loading3.json', fit: BoxFit.fill)
                //     :
                Column(children: [
              ListTile(
                title: categoryList == null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(
                              height: 50,
                              child: Lottie.asset('assets/Loading3.json',
                                  fit: BoxFit.cover)),
                        ],
                      )
                    : Text("${categoryList?.categories?[index].name}",
                        style: Theme.of(context).textTheme.bodyLarge),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CategotiesCatalogScreen(
                                catagegoryID:
                                    "${categoryList?.categories?[index].id}",
                              )));
                },
              ),
              Divider(color: Theme.of(context).colorScheme.onSurface),
              // const SizedBox(height: 10),
            ]);
            // Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //   Padding(
            //     padding: const EdgeInsets.only(left: 20),
            //     child: TextButton(
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => CategotiesCatalogScreen(
            //                         catagegoryID:
            //                             "${categoryList?.categories?[index].id}",
            //                       )));
            //         },
            //         child: Text("${categoryList?.categories?[index].name}",
            //             style: Theme.of(context).textTheme.bodyLarge)),
            //   ),
            //   Divider(color: Theme.of(context).colorScheme.onSurface),
            //   // const SizedBox(height: 10),
            // ]);
          },
          itemCount: categoryList?.categories?.length,
        ))
      ]),
    );
  }
}
