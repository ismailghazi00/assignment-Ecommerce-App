import 'package:assignment_ecommerce_app_ismail/modules/favorites_module.dart';
import 'package:assignment_ecommerce_app_ismail/modules/product_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lottie/lottie.dart';

import '../screens/page_view.dart';
import '../screens/product_card_scree.dart';

class TileWidget01 extends StatefulWidget {
  final Function setTheState;
  final int index;
  Product? product;
  TileWidget01(
      {super.key,
      required this.product,
      required this.index,
      required this.setTheState});

  @override
  State<TileWidget01> createState() => _TileWidget01State();
}

class _TileWidget01State extends State<TileWidget01> {
  Icon unCheckIcon =
      const Icon(Icons.favorite_border, color: Color(0xffABB4BD));
  Icon checkIcon = const Icon(Icons.favorite, color: Color(0xffEF3651));
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return
        // widget.product == null
        //     ? Lottie.asset('assets/Loading2.json', fit: BoxFit.fill)
        //     :
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              width: 150,
              height: 266,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none, //to over flow the text widget
                      children: [
                        InkWell(
                          onTap: () {
                            if (widget.product != null) {
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
                            }
                          },
                          child: Container(
                            height: 184,
                            width: 148,
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: Lottie.asset(
                              //         '${widget.product?.products?[widget.index].image}'),
                              //     fit: BoxFit.cover,
                              //     alignment: Alignment.topCenter),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: widget.product?.products?[widget.index]
                                        .image ==
                                    null
                                ? Container(
                                    height: 184,
                                    width: 148,
                                    child: Lottie.asset(
                                      'assets/shimmer.json',
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Image.network(
                                    '${widget.product?.products?[widget.index].image}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Container(
                                  height: 24,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      //-------ButtonColor
                                      color: widget
                                                  .product
                                                  ?.products?[widget.index]
                                                  .tag
                                                  ?.name ==
                                              'New'
                                          ? Theme.of(context)
                                              .colorScheme
                                              .background
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary),
                                  child: Center(
                                      //ButtonText
                                      child: Text(
                                          widget
                                                  .product
                                                  ?.products?[widget.index]
                                                  .tag
                                                  ?.name ??
                                              'NEW',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall))),
                            )),
                        Positioned(
                          top: 160,
                          left: 100,
                          //--------------------customed checkBox
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.background,
                                  fixedSize: const Size(36, 36),
                                  shape: const CircleBorder(
                                      side: BorderSide.none)),
                              onPressed: () {
                                isFavorite = !isFavorite;
                                setState(() {
                                  favModule.addToFavorite(
                                      widget
                                          .product!.products![widget.index].id,
                                      widget.product!.products![widget.index]
                                          .name,
                                      widget.product!.products![widget.index]
                                          .image,
                                      widget.product!.products![widget.index]
                                          .price,
                                      widget.product?.products?[widget.index]
                                          .rating,
                                      widget.product?.products?[widget.index]
                                          .reviews
                                          .toString());
                                });

                                // if (isFavorite == false) {
                                //   isFavorite = true;
                                //   checkBoxIconColor = Icon(Icons.favorite,
                                //       color: Theme.of(context).colorScheme.primary);
                                // } else {
                                //   isFavorite = false;
                                //   checkBoxIconColor = Icon(
                                //       Icons.favorite_border_outlined,
                                //       color:
                                //           Theme.of(context).colorScheme.onSurface);
                                // }
                                widget.setTheState();
                              },
                              child:
                                  isFavorite == true ? checkIcon : unCheckIcon),
                        ),
                      ],
                    ),
                    Row(children: [
                      //----------------------Ratting Bar
                      RatingBar(
                        ignoreGestures: true,
                        onRatingUpdate: (intt) {},
                        maxRating: 5,
                        minRating: 1,
                        initialRating: widget
                                    .product?.products?[widget.index].rating ==
                                null
                            ? 0
                            : double.parse(
                                '${widget.product?.products?[widget.index].rating}'),
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
                        widget.product?.products?[widget.index].reviews != null
                            ? '(${widget.product?.products?[widget.index].reviews})'
                            : '(0)',
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ]),
                    Text(
                        widget.product?.products?[widget.index].category
                                ?.name ??
                            'Loading',
                        style: Theme.of(context).textTheme.titleSmall),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                            widget.product?.products?[widget.index].name ??
                                'Loading',
                            style: Theme.of(context).textTheme.bodyLarge)),
                    Text(
                        widget.product?.products?[widget.index].price ??
                            'Loading',
                        style: Theme.of(context).textTheme.titleSmall),
                    // widget.product.products?[widget.index].price != null
                    //     ? Row(
                    //         children: [
                    //           Text(
                    //               '${widget.product.products?[widget.index].price}\$',
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleSmall
                    //                   ?.copyWith(
                    //                       decoration: TextDecoration
                    //                           .lineThrough //LineThroug Text Property
                    //                       )),
                    //           const SizedBox(width: 5),
                    //           Text('$newPrice\$',
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleSmall
                    //                   ?.copyWith(
                    //                       color: Theme.of(context)
                    //                           .colorScheme
                    //                           .primary))
                    //         ],
                    //       )
                    //     : Text('${widget.product.products?[widget.index].price}\$',
                    //         style: Theme.of(context).textTheme.titleSmall)
                  ]),
            ));
  }

////to do
  Padding tagnew() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Container(
          height: 24,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              //-------ButtonColor
              color: widget.product?.products?[widget.index].tag?.name == 'New'
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.primary),
          child: Center(
              //ButtonText
              child: Text(
                  widget.product?.products?[widget.index].tag?.name ?? 'NEW',
                  style: Theme.of(context).textTheme.bodySmall))),
    );
  }
}
