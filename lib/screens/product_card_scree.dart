import 'package:assignment_ecommerce_app_ismail/screens/reviews_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

import '../modules/product_class.dart';
import '../widgets/color_bottomsheet.dart';
import '../widgets/item_tile01.dart';
import '../widgets/size_botomsheet.dart';

class ProductCardScreen extends StatefulWidget {
  final Function setTheState;
  final int index;
  Product? product;
  ProductCardScreen(
      {super.key,
      required this.product,
      required this.index,
      required this.setTheState});

  @override
  State<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  Icon unCheckIcon =
      const Icon(Icons.favorite_border, color: Color(0xffABB4BD));
  Icon checkIcon = const Icon(Icons.favorite, color: Color(0xffEF3651));
  bool isFavorite = false;
  // final imageList = [
  //   Image.asset('assets/girlCoverPicture.jpg',
  //       fit: BoxFit.cover, alignment: Alignment.topCenter),
  //   Image.asset('assets/girlcover02.jpg',
  //       fit: BoxFit.cover, alignment: Alignment.topCenter),
  // ];

  // String brandName = 'Short black dress';
  // String itemName = 'H&M';
  // double price = 19.99;
  // int? starRatingNumber;
  // String itemDiscreption =
  //     'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.';
  // String tempImage = 'assets/girlCoverPicture.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height: 18),
        Row(mainAxisSize: MainAxisSize.min, children: [
          //------------------Back Button
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 18)),
          // const Spacer(),
          Text('Short dress', style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.share, size: 18)),
        ]),
        SizedBox(
            height: 413,
            child: Image.network(
                '${widget.product?.products?[widget.index].image}',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter)),

        // CarouselSlider.builder(
        //     itemCount: imageList.length,
        //     itemBuilder: (context, index, realIndex) {
        //       return imageList[index];
        //     },
        //     options: CarouselOptions(
        //       //https://www.youtube.com/watch?v=JEMx2ax0734
        //       aspectRatio: 275 / 413, //pictures Size (w/h)
        //       viewportFraction: 1,
        //       height: 413,
        //       enableInfiniteScroll: true, //wont scrol once list ends
        //       // autoPlay: true,
        //       // autoPlayInterval: const Duration(seconds: 3), //time to start
        //       // autoPlayAnimationDuration: const Duration(milliseconds: 800),
        //       // autoPlayCurve: Curves.fastOutSlowIn, //animation type
        //       disableCenter: true,
        //     )),
        const SizedBox(height: 10),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizeBottomSheet();
                            },
                          );
                        },
                        child: sizeandColorContainer('Size')),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return ColorBottomSheet();
                            },
                          );
                        },
                        child: sizeandColorContainer('Color')),
                    ElevatedButton(
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
                  ]),
              const SizedBox(height: 10),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  width: 300,
                  child: Text(
                    '${widget.product?.products?[widget.index].name}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                const Spacer(),
                Text(
                  '${widget.product?.products?[widget.index].price.toString()}Rs',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ]),
              Text('${widget.product?.products?[widget.index].category?.name}',
                  style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 10),

              //----------------------Ratting Bar
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReviewsScreen(
                                product: widget.product,
                                index: widget.index,
                                setTheState: widget.setTheState,
                              )));
                },
                child: Row(children: [
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
                            color: Theme.of(context).colorScheme.surface),
                        half: Container(),
                        empty: Icon(Icons.star_border,
                            color: Theme.of(context).colorScheme.onSurface)),
                  ),
                  Text(
                    widget.product?.products?[widget.index].reviews != null
                        ? '(${widget.product?.products?[widget.index].reviews})'
                        : '(0)',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ]),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: SingleChildScrollView(
                  //scrollable text
                  scrollDirection: Axis.vertical,
                  child: Text(
                    '${widget.product?.products?[widget.index].description}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(height: 1.2),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(343, 48),
                        shadowColor: Theme.of(context).colorScheme.primary,
                        elevation: 8, //Shadow radius
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: Text('ADD TO CART',
                        style: Theme.of(context).textTheme.bodyMedium)),
              ),
            ])),
        const SizedBox(height: 20),
        const Divider(),
        ListTile(
          title: Text('Shipping info',
              style: Theme.of(context).textTheme.bodyLarge),
          trailing: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 18)),
        ),
        const Divider(),
        ListTile(
          title: Text('Suoort', style: Theme.of(context).textTheme.bodyLarge),
          trailing: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios, size: 18)),
        ),
        const Divider(),
        SizedBox(
            height: 337,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Row(children: [
                  const SizedBox(width: 15),
                  Text(
                    'You can also like this',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text('12 items',
                        style: Theme.of(context).textTheme.titleSmall),
                  )
                ]),
                const SizedBox(height: 5),
                Expanded(
                  child: ListView.builder(
                      itemBuilder: ((context, index) {
                        return TileWidget01(
                          product: widget.product,
                          index: index,
                          setTheState: widget.setTheState,
                          // starRatingNumber: ,
                        );

                        // showItemsTile();
                      }),
                      itemCount: widget.product?.products?.length ?? 5,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics()),
                )
              ]),
            )),
      ]),
    ));
  }

  Container sizeandColorContainer(String childText, {double? w, double? h}) {
    return Container(
        width: w ?? 138,
        height: h ?? 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffABB4BD))),
        child: Center(child: Text(childText)));
  }
}
