import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../modules/product_class.dart';
import '../screens/product_card_scree.dart';

class TileWidget02 extends StatefulWidget {
  final Function setTheState;
  final int index;
  Product product;

  TileWidget02(
      {super.key,
      required this.product,
      required this.index,
      required this.setTheState});

  @override
  State<TileWidget02> createState() => _TileWidget02State();
}

class _TileWidget02State extends State<TileWidget02> {
  Icon unCheckIcon =
      const Icon(Icons.favorite_border, color: Color(0xffABB4BD));
  Icon checkIcon = const Icon(Icons.favorite, color: Color(0xffEF3651));
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductCardScreen(
                      index: widget.index,
                      product: widget.product,
                      setTheState: widget.setTheState,
                    )
                // VisualFindingScreen(),
                ));
      },
      child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15),
          child: Stack(
            clipBehavior: Clip.none, //to over flow the text widget
            children: [
              Container(
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
                            '${widget.product?.products?[widget.index].image}',
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter),
                      ),
                      const SizedBox(width: 10),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 220,
                              height: 20,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                    '${widget.product?.products?[widget.index].name}',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),
                            ),
                            Text(
                                '${widget.product?.products?[widget.index].category?.name}',
                                style: Theme.of(context).textTheme.titleSmall),
                            const SizedBox(height: 5),

                            //----------------------Ratting Bar
                            Row(
                              children: [
                                RatingBar(
                                  onRatingUpdate: (intt) {},
                                  maxRating: 5,
                                  minRating: 1,
                                  initialRating: double.parse(
                                      '${widget.product?.products?[widget.index].rating}'),
                                  allowHalfRating: false,
                                  itemSize: 18,
                                  // itemPadding: const EdgeInsets.symmetric(horizontal:0),
                                  ratingWidget: RatingWidget(
                                      full: Icon(Icons.star,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface),
                                      half: Container(),
                                      empty: Icon(Icons.star_border,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface)),
                                ),
                                Text(
                                  widget.product?.products?[widget.index]
                                              .reviews !=
                                          null
                                      ? '(${widget.product?.products?[widget.index].reviews})'
                                      : '(0)',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Text(
                                '${widget.product?.products?[widget.index].price}Rs',
                                style: Theme.of(context).textTheme.titleSmall),
                            // widget.newPrice != null
                            //     ? Row(
                            //         children: [
                            //           Text('${widget.price}\$',
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .titleSmall
                            //                   ?.copyWith(
                            //                       decoration: TextDecoration
                            //                           .lineThrough //LineThroug Text Property
                            //                       )),
                            //           const SizedBox(width: 5),
                            //           Text('${widget.newPrice}\$',
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .titleSmall
                            //                   ?.copyWith(
                            //                       color: Theme.of(context)
                            //                           .colorScheme
                            //                           .primary))
                            //         ],
                            //       )
                            //     : Text('${widget.price}\$',
                            //         style:
                            //             Theme.of(context).textTheme.titleSmall),
                            const SizedBox(height: 10),
                          ]),
                    ]),
              ),
              Positioned(
                top: 80,
                right: BorderSide.strokeAlignCenter,
                //--------------------customed checkBox
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        fixedSize: const Size(36, 36),
                        shape: const CircleBorder(side: BorderSide.none)),
                    onPressed: () {
                      isFavorite = !isFavorite;
                      widget.setTheState();
                    },
                    child: isFavorite == true ? checkIcon : unCheckIcon),
              ),
            ],
          )),
    );
  }
}
