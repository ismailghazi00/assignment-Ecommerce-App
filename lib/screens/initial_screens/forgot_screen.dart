import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios, size: 18)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text("Forgot password",
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              const SizedBox(height: 100),
              Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 10),

              //---------------------- Text Fields
              TextField(
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).colorScheme.onBackground,
                  decoration: textFieldDecoration('Email')),
              Text(
                'Not a valid email address. Should be your@email.com',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: 50),

              //----------------------Login Button
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(343, 48),
                      shadowColor: Theme.of(context).colorScheme.primary,
                      elevation: 8, //Shadow radius
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text('LOGIN',
                      style: Theme.of(context).textTheme.bodyMedium)),
              const Spacer(),
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
