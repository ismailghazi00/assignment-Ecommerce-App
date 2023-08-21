import 'dart:convert';
import 'package:assignment_ecommerce_app_ismail/screens/initial_screens/visual_finding_screen.dart';
import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../modules/login_signup_module.dart';
import 'forgot_screen.dart';
import 'package:http/http.dart' as http;

class LogInScreen extends StatefulWidget {
  // LogInModules? logInModules;
  LogInScreen({
    super.key,
    // this.logInModules
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();
  Login _login = Login();
  bool isUserLogin = false;
  Future<void> loginAPIfuncation() async {
    try {
      Response response = await http.put(
          Uri.parse('https://ecommerce.salmanbediya.com/users/login'),
          body: {
            'email': emailLoginController.text,
            'password': passwordLoginController.text
          });
      print('-----------statusCode= ${response.statusCode}------------');
      print(response.body);
      if (response.statusCode == 200) {
        setState(() {
          _login = Login.fromJson(jsonDecode(response.body));
          isUserLogin = true;
          logInModules.saveLogin(isUserLogin);

          print(
              '-------------------------------------is user Login at login page ${isUserLogin}');
          print(
              '-------------------------------------is user Login${logInModules.isUserLogin}');
        });
      } else {}
    } catch (error) {
      print('Error Error Error $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false, //to ovied overflow when keborde isused
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: [
                    const SizedBox(height: 10),
                    Row(children: [
                      //------------------Back Button

                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios, size: 18)),
                    ]),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text("Login",
                            style: Theme.of(context).textTheme.headlineLarge),
                      ],
                    ),
                    const SizedBox(height: 85),
                    //---------------------- Text Fields

                    TextField(
                        controller: emailLoginController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        cursorColor: Theme.of(context).colorScheme.onBackground,
                        decoration: textFieldDecoration('Email')),
                    const SizedBox(height: 10),
                    TextField(
                        controller: passwordLoginController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        cursorColor: Theme.of(context).colorScheme.onBackground,
                        decoration: textFieldDecoration('Password')),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        'Forgot your password?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      //-------------------Forget Button
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordScreen()));
                          },
                          icon: Icon(
                            Icons.arrow_right_alt,
                            color: Theme.of(context).colorScheme.primary,
                          ))
                    ]),
                    const SizedBox(height: 30),
                    //----------------------Login Button
                    ElevatedButton(
                        onPressed: () {
                          loginAPIfuncation().then((value) {
                            if (isUserLogin == true) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        // const PageViewScreen()
                                        const VisualFindingScreen(),
                                  ));
                            } else {}
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(343, 48),
                            shadowColor: Theme.of(context).colorScheme.primary,
                            elevation: 8, //Shadow radius
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text('LOGIN',
                            style: Theme.of(context).textTheme.bodyMedium)),
                    const Spacer(),
                    Text("Or login with social account",
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 10),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fixedSize: const Size(92, 64),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Image.asset("assets/GoogleLogo.png")),
                          const SizedBox(width: 20),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fixedSize: const Size(92, 64),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Image.asset("assets/fbLogo.png")),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35)
                  ])),
            ),
          ),
        ));
  }

  InputDecoration textFieldDecoration(lableText) {
    return InputDecoration(
        label: Text(lableText, style: Theme.of(context).textTheme.titleMedium),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 25),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.error)));
  }
}
