import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  bool? isDefault = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(height: 15),
        Text('Add new card', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        textContainer('Name on card'),
        textContainerwithPic('Card number', 'assets/mastercardlogo.png'),
        textContainer('Expire Date'),
        textContainerwithPic('CVV', 'assets/helpoutline.png'),
        Row(children: [
          Checkbox(
              checkColor: Theme.of(context).colorScheme.background,
              value: isDefault,
              onChanged: (v) {
                setState(() {
                  isDefault = v;
                });
              }),
          Text('Set as default payment method',
              style: Theme.of(context).textTheme.bodyMedium)
        ]),
        const SizedBox(height: 10),
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
            child: Text('ADD CARD',
                style: Theme.of(context).textTheme.bodyMedium)),
        const SizedBox(height: 10),
      ]),
    );
  }

  Padding textContainer(String lableText) {
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
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.error)),
                ))),
      ),
    );
  }

  Padding textContainerwithPic(String lableText, String imageurl) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(children: [
        Container(
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
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error)),
                  ))),
        ),
        Positioned(
          right: 3,
          top: 5,
          bottom: 5,
          child: Image.asset(imageurl),
        ),
      ]),
    );
  }
}
