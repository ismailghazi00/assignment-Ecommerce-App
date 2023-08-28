import 'package:assignment_ecommerce_app_ismail/screens/bag_screens/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/add_payment_method_widget.dart';
import 'add_shipping_address.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: Text('Checkout',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 30),
            SizedBox(
                height: 145,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shipping address',
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 10),
                      Center(
                          child: Container(
                              height: 108,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(children: [
                                          Text('Name',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                          const Spacer(),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AssShippingAddressScreen()));
                                            },
                                            child: Text('Change',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary)),
                                          )
                                        ]),
                                        Text('Address',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                        Text('City+ZipCoed999+Country',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium),
                                      ]))))
                    ])),
            const SizedBox(height: 30),
            SizedBox(
                height: 72,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(children: [
                        Text('Payment',
                            style: Theme.of(context).textTheme.headlineSmall),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  //elevation = hight if we wont give hight it will get it auto
                                  // MediaQuery.of(context).viewInsets.bottom mens with respect of the bottom because when the keborde pop up the bouttom will be changed, after keborde opens the botume will statrt from where the keborde ends
                                  //as we given the mediaQ... in paddint at botom the padint will set the bottom with respect of current bottom
                                  // also aded MainAxisSize.min in colloum that return here
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      child: const AddPaymentMethodScreen(),
                                    );
                                  });
                            },
                            child: Text('Change',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary))),
                        const SizedBox(width: 15)
                      ]),
                      const SizedBox(height: 10),
                      Row(children: [
                        Image.asset(
                          'assets/cardlogo.png',
                          // width: 128,
                          // height: 76,
                        ),
                        const SizedBox(width: 5),
                        Text('**** **** **** 3947',
                            style: Theme.of(context).textTheme.bodyMedium)
                      ])
                    ])),
            const SizedBox(height: 30),
            SizedBox(
                height: 109,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Delivery method',
                          style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Image.asset(
                                  'assets/fedex.png',
                                ),
                              ),
                              InkWell(
                                child: Image.asset(
                                  'assets/usps.png',
                                ),
                              ),
                              InkWell(
                                child: Image.asset(
                                  'assets/dhl.png',
                                ),
                              ),
                            ]),
                      )
                    ])),
            const Spacer(),
            Row(children: [
              const SizedBox(width: 3),
              Text('Order:', style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              Text('112', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: 3),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const SizedBox(width: 3),
              Text('Delivery:', style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              Text('15', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: 3),
            ]),
            const SizedBox(height: 10),
            Row(children: [
              const SizedBox(width: 3),
              Text('Summary:', style: Theme.of(context).textTheme.titleLarge),
              const Spacer(),
              Text('127', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: 3),
            ]),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuccessScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(343, 48),
                      shadowColor: Theme.of(context).colorScheme.primary,
                      elevation: 8, //Shadow radius
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  child: Text('SUBMIT ORDER',
                      style: Theme.of(context).textTheme.bodyMedium)),
            ),
            const SizedBox(height: 20),
          ]),
        ));
  }
}
