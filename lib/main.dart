import 'package:assignment_ecommerce_app_ismail/screens/initial_screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff1E1F28),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 34,
              fontFamily: 'Metropolis',
              color: Color(0xffF6F6F6),
              fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(
              fontSize: 24,
              fontFamily: 'Metropolis',
              color: Color(0xffF6F6F6),
              fontWeight: FontWeight.w600,
              height: 1.5),
          headlineSmall: TextStyle(
              fontSize: 18,
              fontFamily: 'Metropolis',
              color: Color(0xffF6F6F6),
              fontWeight: FontWeight.w500,
              height: 1.2),
          bodyLarge: TextStyle(
              fontSize: 16, fontFamily: 'Metropolis', color: Color(0xffF6F6F6)),
          bodyMedium: TextStyle(
              fontSize: 14, fontFamily: 'Metropolis', color: Color(0xffF6F6F6)),
          bodySmall: TextStyle(
              fontSize: 11, fontFamily: 'Metropolis', color: Color(0xffF6F6F6)),
          titleMedium: TextStyle(
              fontSize: 14, fontFamily: 'Metropolis', color: Color(0xffABB4BD)),
          titleSmall: TextStyle(
              fontSize: 11, fontFamily: 'Metropolis', color: Color(0xffABB4BD)),
        ),
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: Color(0xffEF3651),
            onPrimary: Color(0xffF5F5F5),
            secondary: Color(0xffF5F5F5),
            onSecondary: Color(0xff2A2C36),
            error: Color(0xffFF2424),
            onError: Color(0xffFF2424),
            background: Color(0xff1E1F28),
            onBackground: Color(0xffF6F6F6),
            surface: Color(0xffFFBA49),
            onSurface: Color(0xffABB4BD)),
      ),
      home: const SignUpScreen(),
    );
  }
}
