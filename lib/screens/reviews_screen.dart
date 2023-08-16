import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../modules/product_class.dart';
import 'add_reviews_screen.dart';

class ReviewsScreen extends StatefulWidget {
  Product? product;
  final Function setTheState;
  final int index;
  ReviewsScreen(
      {super.key,
      required this.product,
      required this.index,
      required this.setTheState});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Row(children: [
          //------------------Back Button
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 18)),
        ]),
        const SizedBox(height: 20),
        Row(children: [
          Text("Rating&Reviews",
              style: Theme.of(context).textTheme.headlineLarge),
        ]),
        Column(children: [
          Text("4.3", style: Theme.of(context).textTheme.headlineLarge),
          Text('23 ratings', style: Theme.of(context).textTheme.titleSmall)
        ]),
        const SizedBox(height: 30),
        Text('8 reviews', style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        ListView.builder(
          itemBuilder: (context, index) {
            return SizedBox(
              height: 313,
              width: 327,
              child: Container(
                  width: 311,
                  height: 297,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).colorScheme.onSurface),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Text('Helene Moore',
                          style: Theme.of(context).textTheme.bodyMedium),
                      Row(children: [
                        RatingBar(
                          //-------------------------------RatingBar
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
                                  color:
                                      Theme.of(context).colorScheme.onSurface)),
                        ),
                        const Spacer(),
                        Text(
                          'June 5, 2019',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ]),
                      SizedBox(
                          height: 199,
                          width: 267,
                          child: Text(
                              'fbbhftrbn teyjhnye5 ey5jnmy5 thw45tryj w56j5yr7hn35ry w45tjh54thj',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(height: 1.2),
                              textAlign: TextAlign.justify)),
                    ]),
                  )),
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddReviewsScreen()));
            },
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(343, 48),
                shadowColor: Theme.of(context).colorScheme.primary,
                elevation: 8, //Shadow radius
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Row(
              children: [
                Icon(Icons.create,
                    color: Theme.of(context).colorScheme.onPrimary),
                Text('Write a review',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            )),
      ]),
    ))));
  }
}
