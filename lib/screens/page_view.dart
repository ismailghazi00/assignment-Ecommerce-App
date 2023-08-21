import 'package:assignment_ecommerce_app_ismail/screens/testscreen.dart';
import 'package:flutter/material.dart';
import '../modules/api_controller.dart';
import '../modules/login_signup_module.dart';
import '../modules/product_class.dart';
import '../modules/review_class.dart';
import 'categories_list_screen01.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home/home_main.dart';
import 'home/home_main_2.dart';
import 'initial_screens/log_in_screen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});
  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

Product newProduct = Product();
Product saleProduct = Product();
Product allProducts = Product();
Review review = Review();
Product productdynimic = Product();

LogInModules logInModules = LogInModules();
APIController apiController = APIController();
// LogInModules logInModules = LogInModules();

Categories categoryList = Categories();
int selactedPageIndex = 0;
PageController pageViewController = PageController();
List<Widget> listofScreens = [
  HomeMian01(newProduct: newProduct),
  CategoriesList(
    categoryList: categoryList,
    // productdynimic: productdynimic,
  ),
  const Text('fsdv'),
  const Text('fsdv'),

  // const ProductCardScreen(),
  TestScreen(logInModules: logInModules),
];
List<Widget> allScreensList = [
  HomeMain02(newProduct: newProduct, saleProduct: saleProduct),
  LogInScreen(
      // logInModules: logInModules
      ),
];

class _PageViewScreenState extends State<PageViewScreen> {
  void setTheState() {
    return setState(() {});
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
