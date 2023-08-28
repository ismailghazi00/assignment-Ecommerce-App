import 'package:assignment_ecommerce_app_ismail/screens/bag_screens/success_screen.dart';
import 'package:assignment_ecommerce_app_ismail/screens/product_card_scree.dart';
import 'package:flutter/material.dart';
import '../../widgets/bag_tile_widget.dart';
import 'checkout_screen.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  void setTheState() {
    return setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 15),
          Row(children: [
            const Spacer(),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(Icons.search, size: 25)),
          ]),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text('My Bag',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 34, fontWeight: FontWeight.w700, height: 0)),
          ),
          const SizedBox(height: 10),
          Center(
              child: bagModule.bagProductList.isEmpty
                  ? SizedBox(
                      width: 343,
                      height: 450,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_bag_rounded,
                              size: 80,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            const SizedBox(height: 30),
                            Text("Please add Products to Bag!!",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontSize: 20)),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      width: 343,
                      height: 450,
                      child: Expanded(
                          child: ListView.builder(
                        itemBuilder: (context, index) {
                          return BagProductTile(
                            setTheState: setTheState,
                            bagModule: bagModule,
                            index: index,
                          );
                        },
                        itemCount: bagModule.bagProductList.length,
                      )))),
          const SizedBox(height: 20),
          SizedBox(
            height: 36,
            child: TextField(
              decoration: textFieldDecoration('Enter your promo code'),
            ),
          ),
          const SizedBox(height: 20),
          Row(children: [
            Text('Total amount',
                style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            Text('124\$', style: Theme.of(context).textTheme.bodyLarge)
          ]),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckOutScreen()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(343, 48),
                    shadowColor: Theme.of(context).colorScheme.primary,
                    elevation: 8, //Shadow radius
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text('CHECK OUT',
                    style: Theme.of(context).textTheme.bodyMedium)),
          ),
        ]));
  }

  InputDecoration textFieldDecoration(lableText) {
    return InputDecoration(
        suffixIcon: ElevatedButton(
            //suffixicons always shows but sufix will show only when prassed textfield
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                fixedSize: const Size(36, 36),
                backgroundColor: Theme.of(context).colorScheme.onSurface,
                shape: const CircleBorder()),
            child: Center(child: Icon(Icons.arrow_forward_ios_rounded))),
        label: Text(lableText, style: Theme.of(context).textTheme.titleMedium),
        contentPadding:
            const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 25),
        filled: true,
        fillColor: Theme.of(context).colorScheme.onSecondary,
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.error)));
  }
}
