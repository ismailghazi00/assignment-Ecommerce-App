import 'dart:io';
import 'package:assignment_ecommerce_app_ismail/screens/initial_screens/vfinding_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../page_view.dart';

class VisualFindingScreen extends StatefulWidget {
  const VisualFindingScreen({super.key});

  @override
  State<VisualFindingScreen> createState() => _VisualFindingScreenState();
}

File? imagePickerCamera;
File? imagePickerGallery;

class _VisualFindingScreenState extends State<VisualFindingScreen> {
  void swtichtheSplashScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const PageViewScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Row(children: [
            //------------------Back Button
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, size: 18)),
            const Spacer(),
            Text('Visual search',
                style: Theme.of(context).textTheme.headlineSmall),
            const Spacer(),
            const SizedBox(width: 20)
          ]),
          const SizedBox(height: 10),
          Expanded(
              child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.black, Colors.transparent]),
                backgroundBlendMode: BlendMode.screen,
                image: DecorationImage(
                    image: AssetImage('assets/FindingScreenImage.png'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Spacer(),
                  Text(
                      'Search for an outfit by taking a photo or uploading an image',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 25),
                  ElevatedButton(
                      onPressed: () async {
                        final ImagePicker imagePicker = ImagePicker();
                        XFile? image = await imagePicker.pickImage(
                            source: ImageSource.camera);
                        setState(() {
                          if (image != null) {
                            imagePickerCamera = File(image.path);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(343, 48),
                          shadowColor: Theme.of(context).colorScheme.primary,
                          elevation: 8, //Shadow radius
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Text('TAKE A PHOTO',
                          style: Theme.of(context).textTheme.bodyMedium)),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () async {
                        final ImagePicker imagePicker = ImagePicker();
                        XFile? image = await imagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          if (image != null) {
                            imagePickerGallery = File(image.path);
                          }
                          Future.delayed(const Duration(seconds: 2),
                              swtichtheSplashScreen);
                          //Future.delayed will perform the funcation (discribed at the end) after the duration discribed in Duration

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisualFindingSplashScreen(
                                    imagePickerGallery: imagePickerGallery),
                              ));
                        });
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(343, 48),
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.onPrimary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50))),
                      child: Text('UPLOAD AN IMAGE',
                          style: Theme.of(context).textTheme.bodyMedium)),
                  const SizedBox(height: 15),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(
                      'Skip',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    //-------------------Skip tp Page view screen Button
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PageViewScreen()));
                        },
                        icon: Icon(
                          Icons.arrow_right_alt,
                          color: Theme.of(context).colorScheme.primary,
                        ))
                  ]),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
