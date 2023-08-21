import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReviewsBottomSheet extends StatefulWidget {
  const AddReviewsBottomSheet({super.key});

  @override
  State<AddReviewsBottomSheet> createState() => _AddReviewsBottomSheetState();
}

bool? withPhoto;
TextEditingController reviewTextController = TextEditingController();

class _AddReviewsBottomSheetState extends State<AddReviewsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      const SizedBox(height: 20),
      Text('What is you rate?',
          style: Theme.of(context).textTheme.headlineSmall),
      const SizedBox(height: 15),
      RatingBar(
        //-------------------------------RatingBar
        onRatingUpdate: (intt) {},
        maxRating: 5,
        minRating: 1,
        initialRating: double.parse('00.00'),
        allowHalfRating: false,
        itemSize: 50,
        itemPadding: const EdgeInsets.symmetric(horizontal: 0),
        ratingWidget: RatingWidget(
            full:
                Icon(Icons.star, color: Theme.of(context).colorScheme.surface),
            half: Container(),
            empty: Icon(Icons.star_border,
                color: Theme.of(context).colorScheme.onSurface)),
      ),
      const SizedBox(height: 20),
      SizedBox(
        height: 44,
        width: 227,
        child: Center(
          child: Text('Please share your opinion about the product?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall),
        ),
      ),
      const SizedBox(height: 15),
      SizedBox(
        height: 154,
        width: 343,
        child: TextField(
          controller: reviewTextController,
          maxLines: null,
          keyboardType:
              TextInputType.multiline, //to unable multi line type keborde
          expands: true, //to expande hight
          cursorColor: Theme.of(context).colorScheme.onSurface,
          decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.onSecondary,
              filled: true,
              hintText: 'Your review',
              hintStyle: Theme.of(context).textTheme.titleSmall,
              border: InputBorder.none),
        ),
      ),
      const SizedBox(height: 40),
      ElevatedButton(
          onPressed: () {
            reviewTextController.clear();
          },
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(343, 48),
              shadowColor: Theme.of(context).colorScheme.primary,
              elevation: 8, //Shadow radius
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: Text('SEND REVIEW',
              style: Theme.of(context).textTheme.bodyMedium)),
      const SizedBox(height: 10),
    ]);
  }
}
