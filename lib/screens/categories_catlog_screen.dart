// import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import '../modules/product_class.dart';
import '../widgets/item_tile02.dart';

class CategotiesCatalogScreen extends StatefulWidget {
  Categories? categoryList;
  Product? allProducts;
  int? categorieIndex;
  CategotiesCatalogScreen(
      {super.key, this.categoryList, this.categorieIndex, this.allProducts});

  @override
  State<CategotiesCatalogScreen> createState() =>
      _CategotiesCatalogScreenState();
}

class _CategotiesCatalogScreenState extends State<CategotiesCatalogScreen> {
  void setTheState() {
    return setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 20),
      Row(children: [
        //------------------Back Button
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 18)),
        const Spacer(),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.search, size: 18)),
      ]),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
            '${widget.categoryList?.categories?[widget.categorieIndex ?? 0].name}',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 34, fontWeight: FontWeight.w700, height: 0)),
      ),
      const SizedBox(height: 10),
      Row(children: [
        const Spacer(),
        const Icon(Icons.swap_vert_outlined),
        Text('Price: lowest to high',
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: 20),
      ]),
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SizedBox(
            height: 30,
            child: Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.categoryList?.categories?.length ?? 5,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: ElevatedButton(
                            //----------------------Categories Buttons
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              backgroundColor:
                                  Theme.of(context).colorScheme.onBackground,
                              // fixedSize: const Size(100, 30), //if i hide the fixed size button will take as musch spae as its needs
                            ),
                            child: Text(
                                '${widget.categoryList?.categories?[index].name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary))),
                      );
                    })))),
      ),
      const SizedBox(height: 15),
      Expanded(
          child: ListView.builder(
              itemCount: widget.allProducts?.products?.length ?? 5,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    TileWidget02(
                      product: widget.allProducts,
                      index: index,
                      setTheState: setTheState,
                    ),
                  ],
                );
              })))
    ]));
  }
}
