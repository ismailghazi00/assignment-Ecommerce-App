import 'package:assignment_ecommerce_app_ismail/screens/profile_screen.dart';
import 'package:assignment_ecommerce_app_ismail/screens/shopScreens/categories_list_screen01.dart';
import 'package:flutter/material.dart';
import '../modules/favorites_module.dart';
import '../modules/login_signup_module.dart';
import 'bag_screens/bag_screen.dart';
import 'favorite_screen.dart';
import 'home/home_main.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});
  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

LogInModules logInModules = LogInModules();
FavModule favModule = FavModule();
int selactedPageIndex = 0;
PageController pageViewController = PageController();
List<Widget> listofScreens = [
  const HomeMian01(),
  const CategoriesList(),
  const BagScreen(),
  const FavoriteScreen(),
  const ProfilScreen()
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
