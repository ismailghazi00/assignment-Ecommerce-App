import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeMain02 extends StatefulWidget {
  const HomeMain02({super.key});

  @override
  State<HomeMain02> createState() => _HomeMain02State();
}

class _HomeMain02State extends State<HomeMain02> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 196,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/girlcover02.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.1), BlendMode.darken))),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Street clothes',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                height: 0)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const MainViewScreen()
                          //         // VisualFindingScreen(),
                          //         ));
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(160, 36),
                            shadowColor: Theme.of(context).colorScheme.primary,
                            elevation: 8, //Shadow radius
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        child: Text('Check',
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ]),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              height: 331,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Row(children: [
                    const SizedBox(width: 15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sale',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text('Super summer sale',
                              style: Theme.of(context).textTheme.titleSmall),
                        ]),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('View all',
                          style: Theme.of(context).textTheme.titleSmall),
                    )
                  ]),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return showItemsTile();
                        }),
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics()),
                  )
                ]),
              )),
          const SizedBox(height: 20),
          SizedBox(
              height: 331,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Row(children: [
                    const SizedBox(width: 15),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text('You’ve never seen it before!',
                              style: Theme.of(context).textTheme.titleSmall),
                        ]),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text('View all',
                          style: Theme.of(context).textTheme.titleSmall),
                    )
                  ]),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return showItemsTile();
                        }),
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics()),
                  )
                ]),
              ))
        ],
      ),
    );
  }

  Padding showItemsTile() {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 150,
          height: 260,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 184,
                    width: 148,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amberAccent,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Container(
                                  height: 24,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .background),
                                  child: Center(
                                      child: Text("NEW",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall))))
                        ])),
                Row(children: [
                  RatingBar(
                    onRatingUpdate: (intt) {},
                    maxRating: 1,
                    minRating: 5,
                    initialRating: 3,
                    allowHalfRating: false,
                    ratingWidget: RatingWidget(
                        full: Icon(Icons.star,
                            color: Theme.of(context).colorScheme.surface),
                        half: Container(),
                        empty: Icon(Icons.star_border,
                            color: Theme.of(context).colorScheme.onSurface)),
                    itemSize: 20,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  ),
                  Text(
                    '(10)',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ]),
                Text('Dorothy Perkins',
                    style: Theme.of(context).textTheme.titleSmall),
                Text(
                  "Evening Dress",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Row(
                  children: [
                    Text('15\$', style: Theme.of(context).textTheme.titleSmall),
                    Text('10\$',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary)),
                  ],
                )
              ]),
        ));
  }
}
