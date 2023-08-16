import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import '../../modules/product_class.dart';

import '../../widgets/item_tile01.dart';
import 'home_main_2.dart';

class HomeMian01 extends StatefulWidget {
  Product? newProduct;

  HomeMian01({super.key, this.newProduct});

  @override
  State<HomeMian01> createState() => _HomeMian01State();
}

class _HomeMian01State extends State<HomeMian01> {
  void setTheState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 536,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/girlCoverPicture.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Fashion',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(
                                fontSize: 48,
                                fontWeight: FontWeight.w700,
                                height: 0)),
                    Text('Sale',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeMain02()
                                  // VisualFindingScreen(),
                                  ));
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
                  const SizedBox(height: 3),
                  Expanded(
                    child: ListView.builder(
                        itemBuilder: ((context, index) {
                          return TileWidget01(
                            index: index,
                            product: newProduct,
                            setTheState: setTheState,
                          );
                        }),
                        itemCount: newProduct.products?.length ?? 5,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics()),
                  )
                ]),
              ))
        ],
      ),
    );
  }
}
