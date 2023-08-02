import 'dart:io';

import 'package:assignment_ecommerce_app_ismail/screens/initial_screens/visual_finding_screen.dart';
import 'package:flutter/material.dart';

class VisualFindingSplashScreen extends StatefulWidget {
  const VisualFindingSplashScreen({super.key, this.imagePickerGallery});
  final imagePickerGallery;
  @override
  State<VisualFindingSplashScreen> createState() =>
      _VisualFindingSplashScreenState();
}

class _VisualFindingSplashScreenState extends State<VisualFindingSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 237,
                width: 235,
                child: Image.file(
                  File('${imagePickerGallery?.path}'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 50),
              Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
                size: 70,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text('Finding similar results...',
                    style: Theme.of(context).textTheme.headlineLarge,
                    textAlign: TextAlign.center),
              )
            ],
          ),
        ));
  }
}
