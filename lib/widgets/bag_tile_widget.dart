import 'package:assignment_ecommerce_app_ismail/modules/bag_module.dart';
import 'package:assignment_ecommerce_app_ismail/modules/favorites_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../screens/product_card_scree.dart';

class BagProductTile extends StatefulWidget {
  BagModule bagModule;
  final int index;
  final Function setTheState;
  BagProductTile(
      {super.key,
      required this.setTheState,
      required this.bagModule,
      required this.index});

  @override
  State<BagProductTile> createState() => _BagProductTileState();
}

class _BagProductTileState extends State<BagProductTile> {
  int producCount = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
        width: 353,
        height: 104,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 104,
                width: 104,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amberAccent,
                ),
                child: Image.network(
                    '${widget.bagModule.bagProductList[widget.index].productImage}',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter),
              ),
              const SizedBox(width: 5),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 5),
                    Row(children: [
                      SizedBox(
                        width: 210,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                              '${widget.bagModule.bagProductList[widget.index].productname}',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      InkWell(child: Icon(Icons.more_vert_outlined))
                    ]),
                    const SizedBox(height: 2),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Color:',
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(width: 2),
                          Text('Black:',
                              style: Theme.of(context).textTheme.titleMedium),
                          const SizedBox(width: 8),
                          Text('Size:',
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(width: 2),
                          Text('XL:',
                              style: Theme.of(context).textTheme.titleMedium)
                        ]),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              if (producCount > 1) {
                                producCount--;
                                widget.setTheState();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                fixedSize: const Size(36, 36),
                                backgroundColor:
                                    Theme.of(context).colorScheme.onSecondary,
                                shadowColor:
                                    Theme.of(context).colorScheme.background,
                                elevation: 8, //Shadow radius
                                shape: const CircleBorder()),
                            child: const Center(child: Icon(Icons.minimize))),
                        const SizedBox(width: 2),
                        Text(
                            // widget.bagModule?.bagProductList[widget.index]
                            //         .productCount ??
                            producCount.toString(),
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(width: 2),
                        ElevatedButton(
                            onPressed: () {
                              producCount++;
                              widget.setTheState();
                            },
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                fixedSize: const Size(36, 36),
                                backgroundColor:
                                    Theme.of(context).colorScheme.onSecondary,
                                shadowColor:
                                    Theme.of(context).colorScheme.background,
                                elevation: 8, //Shadow radius
                                shape: CircleBorder()),
                            child: Center(child: Icon(Icons.add))),
                        const SizedBox(width: 5),
                        Text(
                            '${double.parse(widget.bagModule.bagProductList[widget.index].productPrice.toString()) * producCount}',
                            style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(width: 2),
                      ],
                    )
                  ]),
            ]),
      ),
    );
  }
}
