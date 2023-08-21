import 'package:assignment_ecommerce_app_ismail/screens/initial_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //initState will hitt onlu once the screen where the funcation esxsest will open
  //that whay i have move the initState all the whay to Splash Screen
  @override
  void initState() {
    logInModules.getLoginData();
    delayFuncation();
    setState(() {
      apiController.getAllProducts();
      apiController.getCategoriesList();
      apiController.getProductNew();
      apiController.getProductSale();
    });
    super.initState();
  }

  void splashScreenSwitch() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => logInModules.isUserLogin == true
                ? const PageViewScreen()
                : const SignUpScreen()));
  }

  void delayFuncation() {
    Future.delayed(const Duration(seconds: 4), splashScreenSwitch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 220,
                child: Flexible(
                    child: Lottie.asset('assets/task.json', fit: BoxFit.fill))),
            const SizedBox(
              height: 100,
            ),
            Text('Designed by Ismail Ghazi',
                style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
