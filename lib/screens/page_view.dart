import 'package:assignment_ecommerce_app_ismail/screens/product_card_scree.dart';
import 'package:assignment_ecommerce_app_ismail/screens/testscreen.dart';
import 'package:flutter/material.dart';
import '../modules/product_class.dart';
import 'categories_catlog_screen.dart';
import 'categories_list_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home/home_main.dart';
import 'home/home_main_2.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});
  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

Product newProduct = Product();
Product saleProduct = Product();
Product allProducts = Product();

Categories categoryList = Categories();
int selactedPageIndex = 0;
PageController pageViewController = PageController();
List<Widget> listofScreens = [
  HomeMian01(newProduct: newProduct),
  CategoriesList(categoryList: categoryList),
  const Text('fsdv'),
  const Text('fsdv'),

  // const ProductCardScreen(),
  const TestScreen(),
];
List<Widget> allScreensList = [
  HomeMain02(newProduct: newProduct, saleProduct: saleProduct),
];

class _PageViewScreenState extends State<PageViewScreen> {
  void setTheState() {
    return setState(() {});
  }

  @override
  void initState() {
    getProductNew();
    setState(() {});
    getCategoriesList();
    getProductSale();
    getAllProducts();
    super.initState();
  }

  Future<void> getProductNew() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/new/getAll'));
    setState(() {
      newProduct = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  Future<void> getAllProducts() async {
    http.Response newResponse = await http
        .get(Uri.parse('https://ecommerce.salmanbediya.com/products/getAll'));
    setState(() {
      allProducts = Product.fromJson(jsonDecode(newResponse.body));
    });
  }

  Future<void> getProductSale() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/sale/getAll'));
    setState(() {
      saleProduct = Product.fromJson(jsonDecode(newResponse.body));
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
      bottomNavigationBar: Container(
        //
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: BottomNavigationBar(
            onTap: (intt) {
              setState(() {
                selactedPageIndex = intt;
                //we used page controllers class funcation .animtaeToPage() to perform page change action
                pageViewController.animateToPage(
                    selactedPageIndex, //an index number on wich we wan to go
                    duration: const Duration(
                        microseconds:
                            300), // duration after wich the change will perform
                    curve: Curves
                        .bounceInOut //the effect to be performed on page change
                    );
              });
            },
            currentIndex: selactedPageIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onBackground,
            showUnselectedLabels: true, //to show unselacted text lable
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
            unselectedLabelStyle: Theme.of(context).textTheme.bodySmall,
            type: BottomNavigationBarType.fixed, //to show backgroun color
            backgroundColor: Theme.of(context).colorScheme.background,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_cart),
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_bag),
                icon: Icon(Icons.shopping_bag_outlined),
                label: 'Bag',
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.favorite_rounded),
                  icon: Icon(Icons.favorite_border_outlined),
                  label: 'Favorites'),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person_rounded),
                  icon: Icon(Icons.person_outline),
                  label: 'Profile'),
            ]),
      ),
      body: PageView(
        controller: pageViewController,
        children: listofScreens,
        onPageChanged: (intt) {
          selactedPageIndex = intt;
        },
      ),
    );
  }
}
