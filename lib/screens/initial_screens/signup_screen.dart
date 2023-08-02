import 'package:flutter/material.dart';

import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  //------------------Back Button

                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()));
                      },
                      icon: const Icon(Icons.arrow_back_ios, size: 18)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Sign up",
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              const SizedBox(height: 85),
              //---------------------- Text Fields

              TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                  decoration: textFieldDecoration('Name')),
              const SizedBox(height: 10),
              TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                  decoration: textFieldDecoration('Email')),
              const SizedBox(height: 10),
              TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                  decoration: textFieldDecoration('Password')),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'Already have an account?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                //-------------------Forget Button
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LogInScreen()));
                    },
                    icon: Icon(
                      Icons.arrow_right_alt,
                      color: Theme.of(context).colorScheme.primary,
                    ))
              ]),
              const SizedBox(height: 30),
              //----------------------Sign Up Button
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LogInScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(343, 48),
                      shadowColor: Theme.of(context).colorScheme.primary,
                      elevation: 8, //Shadow radius
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text('SIGN UP',
                      style: Theme.of(context).textTheme.bodyMedium)),
              const Spacer(),
              Text("Or sign up with social account",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Image.asset("assets/GoogleLogo.png")),
                    const SizedBox(width: 20),
                    ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.onBackground,
                            fixedSize: const Size(92, 64),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: Image.asset("assets/fbLogo.png")),
                  ],
                ),
              ),
              const SizedBox(height: 35)
            ])));
  }

  InputDecoration textFieldDecoration(lableText) {
    return InputDecoration(
        label: Text(lableText, style: Theme.of(context).textTheme.titleMedium),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 25),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
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
