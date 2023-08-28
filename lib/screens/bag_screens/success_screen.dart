import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      const Spacer(),
      SizedBox(
          width: 400,
          child: Flexible(
              child: Lottie.asset('assets/shopingbag.json', fit: BoxFit.fill))),
      Text('Success!',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontSize: 34, fontWeight: FontWeight.w700, height: 0)),
      const SizedBox(height: 15),
      Text('Your order will be delivered soon.',
          style: Theme.of(context).textTheme.titleMedium),
      Text('Thank you for choosing our app!',
          style: Theme.of(context).textTheme.titleMedium),
      const Spacer(),
      ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PageViewScreen()));
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(343, 48),
              shadowColor: Theme.of(context).colorScheme.primary,
              elevation: 8, //Shadow radius
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: Text('CONTINUE SHOPPING',
              style: Theme.of(context).textTheme.bodyMedium)),
      const SizedBox(height: 30),
    ])));
  }
}
