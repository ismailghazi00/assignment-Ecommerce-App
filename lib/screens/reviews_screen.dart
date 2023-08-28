import 'dart:convert';

import 'package:assignment_ecommerce_app_ismail/modules/review_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/add_reviews_bottomSheet.dart';
import 'package:http/http.dart' as http;

class ReviewsScreen extends StatefulWidget {
  String? reviewsID;

  final Function setTheState;
  ReviewsScreen(
      {super.key, required this.reviewsID, required this.setTheState});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

bool isHelpFull = false;
Icon helpFullIcon = const Icon(
  Icons.thumb_up,
  color: Color(0xffABB4BD),
  size: 15,
);
Icon unHelpFullIcon =
    const Icon(Icons.thumb_up_alt_outlined, color: Color(0xffABB4BD), size: 15);

class _ReviewsScreenState extends State<ReviewsScreen> {
  Review? review;
  @override
  void initState() {
    getReviews();
    super.initState();
  }

  Future<void> getReviews() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/review/get/${widget.reviewsID}'));
    setState(() {
      review = Review.fromJson(jsonDecode(newResponse.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: flotingElevatedButton(),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            Text("Rating&Reviews",
                style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 20),
            Column(children: [
              Text('${review?.reviews?[0].rating}',
                  style: Theme.of(context).textTheme.headlineLarge),
              Text('${review?.reviews?.length.toString()} ratings',
                  style: Theme.of(context).textTheme.titleSmall)
            ]),
            const SizedBox(height: 50),
            Text('${review?.reviews?.length.toString()} reviews',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 15),
            SizedBox(
              height: 722,
              child: Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return reviewTile(
                        reviewDate: review?.reviews?[index].user?.dateCreated,
                        review: review?.reviews?[index].review,
                        rating: review?.reviews?[index].rating,
                        reviewerName: review?.reviews?[index].user?.name);
                  },
                  itemCount: review?.reviews?.length,
                ),
              ),
            ),
          ]),
        )));
  }

  Padding reviewTile({
    String? reviewerName,
    String? rating,
    String? reviewDate,
    String? review,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 2, bottom: 8, right: 8),
      child: Center(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Container(
                width: 330,
                height: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.onSecondary),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        Text(reviewerName ?? 'Loading',
                            style: Theme.of(context).textTheme.bodyMedium),
                        const SizedBox(height: 5),
                        Row(children: [
                          RatingBar(
                            //-------------------------------RatingBar
                            onRatingUpdate: (intt) {},
                            maxRating: 5,
                            minRating: 1,
                            initialRating: double.parse(rating ?? '00.00'),
                            allowHalfRating: false,
                            itemSize: 18,
                            // itemPadding: const EdgeInsets.symmetric(horizontal:0),
                            ratingWidget: RatingWidget(
                                full: Icon(Icons.star,
                                    color:
                                        Theme.of(context).colorScheme.surface),
                                half: Container(),
                                empty: Icon(Icons.star_border,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface)),
                          ),
                          const Spacer(),
                          Text(reviewDate?.substring(0, 10) ?? 'Loading',
                              style: Theme.of(context).textTheme.titleSmall),
                        ]),
                        const SizedBox(height: 10),
                        SizedBox(
                            height: 199,
                            child: Text(review ?? 'Loading',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(height: 1.2),
                                textAlign: TextAlign.justify)),
                        Row(
                          children: [
                            const Spacer(),
                            Text('Helpful',
                                style: Theme.of(context).textTheme.titleSmall),
                            IconButton(
                                //dummay Helpfull Button
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    isHelpFull = !isHelpFull;
                                  });
                                },
                                icon: isHelpFull == true
                                    ? helpFullIcon
                                    : unHelpFullIcon)
                          ],
                        )
                      ]),
                )),
          ),
          Positioned(
              left: 0,
              top: 0,
              child: CircleAvatar(
                radius: 21,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary),
              )),
        ]),
      ),
    );
  }

  ElevatedButton flotingElevatedButton() {
    return ElevatedButton(
        onPressed: () {
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
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddReviewsBottomSheet(),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(158, 36),
            shadowColor: Theme.of(context).colorScheme.primary,
            elevation: 8, //Shadow radius
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        child: Row(
          children: [
            Icon(Icons.create, color: Theme.of(context).colorScheme.onPrimary),
            Text('Write a review',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ));
  }
}
