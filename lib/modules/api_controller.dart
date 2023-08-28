// import 'dart:convert';
// import 'package:assignment_ecommerce_app_ismail/modules/product_class.dart';
// import 'package:assignment_ecommerce_app_ismail/modules/review_class.dart';
// import 'package:http/http.dart' as http;
// import '../screens/page_view.dart';

// class APIController {
//   Future<void> getProductNew(Product? product) async {
//     http.Response newResponse = await http.get(Uri.parse(
//         'https://ecommerce.salmanbediya.com/products/tag/new/getAll'));
//     product = Product.fromJson(jsonDecode(newResponse.body));
//   }

//   Future<Product> getAllProducts() async {
//     http.Response newResponse = await http
//         .get(Uri.parse('https://ecommerce.salmanbediya.com/products/getAll'));
//     return Product.fromJson(jsonDecode(newResponse.body));
//   }

//   Future<Product> getProductSale() async {
//     http.Response newResponse = await http.get(Uri.parse(
//         'https://ecommerce.salmanbediya.com/products/tag/sale/getAll'));
//     return Product.fromJson(jsonDecode(newResponse.body));
//   }

//   Future<Categories> getCategoriesList() async {
//     http.Response newResponse = await http.get(Uri.parse(
//         'https://ecommerce.salmanbediya.com/products/category/getAll'));
//     return Categories.fromJson(jsonDecode(newResponse.body));
//   }

//   Future<Product> getproductDynimic({
//     required String categoryID,
//   }) async {
//     http.Response newResponse = await http.get(Uri.parse(
//         'https://ecommerce.salmanbediya.com/products/get/category/$categoryID'));
//     return Product.fromJson(jsonDecode(newResponse.body));
//   }

//   // Future<void> getProduct({
//   //   required Product clasObjetc,
//   //   required String link,
//   // }) async {
//   //   http.Response newResponse =
//   //       await http.get(Uri.parse('https://ecommerce.salmanbediya.com/$link'));
//   //   clasObjetc = Product.fromJson(jsonDecode(newResponse.body));
//   // }

//   Future<Review> getReviews({required String? reviewsID}) async {
//     http.Response newResponse = await http.get(Uri.parse(
//         'https://ecommerce.salmanbediya.com/products/review/get/$reviewsID'));
//     return Review.fromJson(jsonDecode(newResponse.body));
//   }
// }
