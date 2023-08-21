import 'package:assignment_ecommerce_app_ismail/screens/page_view.dart';
import 'package:flutter/material.dart';
import '../modules/product_class.dart';
import 'categories_catlog_screen02.dart';

class CategoriesList extends StatefulWidget {
  Categories? categoryList;
  // Product? allProducts;
  // Product productdynimic;
  CategoriesList({
    super.key,
    this.categoryList,
    // this.allProducts,
    // required this.productdynimic
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  void getproductData(String id) {
    setState(() {
      apiController.getproductDynimic(
        categoryID: id,
      );
    });
  }

  void navigatetoNext() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategotiesCatalogScreen(
                  product: productdynimic,
                  categoryList: categoryList,
                  categoryName: null,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          //------------------Back Button
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios, size: 18)),
          const Spacer(),
          Text('Categories', style: Theme.of(context).textTheme.headlineSmall),
          const Spacer(),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.search, size: 18)),
        ]),
        const SizedBox(height: 10),
        Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CategotiesCatalogScreen(
                              product: allProducts,
                              categoryList: categoryList,
                              categoryName: 'All Categories',
                            )
                        // VisualFindingScreen(),
                        ));
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(343, 48),
                  shadowColor: Theme.of(context).colorScheme.primary,
                  elevation: 8, //Shadow radius
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              child: Text('VIEW ALL ITEMS',
                  style: Theme.of(context).textTheme.bodyMedium)),
        ),
        const SizedBox(height: 15),
        Text('Choose category', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 10),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            getproductData(
                                "${categoryList.categories?[index].id}");
                          });

                          Future.delayed(
                              const Duration(seconds: 1), navigatetoNext);
                        },
                        child: Text("${categoryList.categories?[index].name}",
                            style: Theme.of(context).textTheme.bodyLarge)),
                  ),
                  Divider(color: Theme.of(context).colorScheme.onSurface),
                  // const SizedBox(height: 10),
                ]);
          },
          itemCount: categoryList.categories?.length,
        ))
      ]),
    );
  }
}
