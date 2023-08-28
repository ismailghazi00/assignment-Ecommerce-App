import 'dart:convert';

import 'package:assignment_ecommerce_app_ismail/modules/login_signup_module.dart';
import 'package:assignment_ecommerce_app_ismail/screens/initial_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../page_view.dart';
import 'log_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // LogInModules? logInModules;
  //initState will hitt onlu once the screen where the funcation esxsest will open
  //that whay i have move the initState all the whay to Splash Screen
  @override
  void initState() {
    setState(() {
      getLoginData();
      getUserDetails();
    });
    delayFuncation();
    super.initState();
  }

  Future<void> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUserLogin = prefs.getBool('isUserLogin') ?? false;
  }

  Future<void> getUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //pref.getString return string type data in jeson format, firts we encode this jason to key value map than we convert this map to the class type object
    login = Login.fromJson(jsonDecode(prefs.getString('Login').toString()));
    print('dekh by data praa hy email ${login.data?.email}');
  }

  void splashScreenSwitch() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => isUserLogin == true
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
