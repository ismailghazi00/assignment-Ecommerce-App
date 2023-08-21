import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:assignment_ecommerce_app_ismail/screens/product_card_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../modules/login_signup_module.dart';
import '../widgets/item_tile01.dart';
import '../widgets/item_tile02.dart';

class TestScreen extends StatefulWidget {
  LogInModules? logInModules;
  TestScreen({super.key, this.logInModules});
  @override
  State<TestScreen> createState() => _TestScreenState();
}

bool isUserLogin = true;

class _TestScreenState extends State<TestScreen> {
  void setTheState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 100,
      ),
      // TileWidget02(
      //   brandName: 'Brand Name',
      //   isFavorite: false,
      //   itemName: "item name",
      //   price: 51,
      //   setTheState: setTheState,
      // ),
      Stack(children: [
        Container(height: 50, width: 50, color: Colors.black),
        Container(height: 100, width: 100, color: Colors.amber),
        Container(height: 50, width: 50, color: Colors.black),
      ]),
      const SizedBox(height: 10),
      ElevatedButton(
          onPressed: () {
            setState(() {
              isUserLogin = false;
              logInModules.saveLogin(isUserLogin);
              print(
                  '-------------------------------------is user Login${widget.logInModules?.isUserLogin}');
            });
            SystemNavigator.pop(); //to exix the app
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(160, 36),
              shadowColor: Theme.of(context).colorScheme.primary,
              elevation: 8, //Shadow radius
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: Text('Logout', style: Theme.of(context).textTheme.bodyMedium)),
    ]);
  }
}
