import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AssShippingAddressScreen extends StatefulWidget {
  const AssShippingAddressScreen({super.key});

  @override
  State<AssShippingAddressScreen> createState() =>
      _AssShippingAddressScreenState();
}

class _AssShippingAddressScreenState extends State<AssShippingAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text('Adding Shipping Address',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body:
          //  SingleChildScrollView(
          //     physics: const AlwaysScrollableScrollPhysics(),
          //     child: ConstrainedBox(
          //         constraints: BoxConstraints(
          //           minWidth: MediaQuery.of(context).size.width,
          //           minHeight: MediaQuery.of(context).size.height,
          //         ),
          //         child: IntrinsicHeight(
          //           child:
          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: [
            textContainer('Full Name'),
            textContainer('Address'),
            textContainer('City'),
            textContainer('State/Province/Region'),
            textContainer('Zip Code (Postal Code)'),
            textContainer('Country'),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => CheckOutScreen()));
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(343, 48),
                    shadowColor: Theme.of(context).colorScheme.primary,
                    elevation: 8, //Shadow radius
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                child: Text('SAVE ADDRESS',
                    style: Theme.of(context).textTheme.bodyMedium)),
            const SizedBox(height: 30),
          ],
        ),
      ),
      // ))),
    );
  }

  Padding textContainer(lableText) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              cursorColor: Theme.of(context).colorScheme.onBackground,
              decoration: InputDecoration(
                label: Text(lableText,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontSize: 15)),
                contentPadding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 10, vertical: 25),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onSecondary,
                border: const OutlineInputBorder(),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error)),
              )),
        ),
      ),
    );
  }
}
