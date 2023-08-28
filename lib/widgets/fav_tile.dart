import 'package:assignment_ecommerce_app_ismail/modules/bag_module.dart';
import 'package:assignment_ecommerce_app_ismail/modules/favorites_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../screens/product_card_scree.dart';

class FavoritesProductTile extends StatefulWidget {
  FavModule? favModule;
  final int index;
  FavoritesProductTile(
      {super.key, required this.favModule, required this.index});

  @override
  State<FavoritesProductTile> createState() => _FavoritesProductTileState();
}

class _FavoritesProductTileState extends State<FavoritesProductTile> {
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
                    '${widget.favModule?.ProductList[widget.index].productImage}',
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
                              '${widget.favModule?.ProductList[widget.index].productname}',
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      InkWell(
                          child: Icon(Icons.close),
                          onTap: () {
                            setState(() {
                              widget.favModule?.ProductList
                                  .removeAt(widget.index);
                            });
                          }),
                      const SizedBox(width: 2),
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
                    Row(children: [
                      RatingBar(
                        ignoreGestures: true,
                        onRatingUpdate: (intt) {},
                        maxRating: 5,
                        minRating: 1,
                        initialRating: double.parse(
                            '${widget.favModule?.ProductList[widget.index].rating}'),
                        allowHalfRating: false,
                        itemSize: 18,
                        // itemPadding: const EdgeInsets.symmetric(horizontal:0),
                        ratingWidget: RatingWidget(
                            full: Icon(Icons.star,
                                color: Theme.of(context).colorScheme.surface),
                            half: Container(),
                            empty: Icon(Icons.star_border,
                                color:
                                    Theme.of(context).colorScheme.onSurface)),
                      ),
                      Text(
                        widget.favModule?.ProductList[widget.index].reviews !=
                                null
                            ? '(${widget.favModule?.ProductList[widget.index].reviews})'
                            : '(0)',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(width: 10),
                      Text(
                          '${widget.favModule?.ProductList[widget.index].productPrice}',
                          style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(width: 2),
                    ]),
                  ]),
            ]),
      ),
    );
  }
}
