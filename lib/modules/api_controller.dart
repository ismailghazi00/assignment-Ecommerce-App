import 'dart:convert';
import 'package:assignment_ecommerce_app_ismail/modules/product_class.dart';
import 'package:assignment_ecommerce_app_ismail/modules/review_class.dart';
import 'package:http/http.dart' as http;
import '../screens/page_view.dart';

class APIController {
  Future<void> getProductNew() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/new/getAll'));
    newProduct = Product.fromJson(jsonDecode(newResponse.body));
  }

  Future<void> getAllProducts() async {
    http.Response newResponse = await http
        .get(Uri.parse('https://ecommerce.salmanbediya.com/products/getAll'));
    allProducts = Product.fromJson(jsonDecode(newResponse.body));
  }

  Future<void> getProductSale() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/tag/sale/getAll'));
    saleProduct = Product.fromJson(jsonDecode(newResponse.body));
  }

  Future<void> getCategoriesList() async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/category/getAll'));
    categoryList = Categories.fromJson(jsonDecode(newResponse.body));
  }

  Future<void> getproductDynimic({
    required String categoryID,
  }) async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/get/category/$categoryID'));
    productdynimic = Product.fromJson(jsonDecode(newResponse.body));
    print(
        '------Funcation Call Hogya--------lenght=${productdynimic.products?.length}');
  }

  // Future<void> getProduct({
  //   required Product clasObjetc,
  //   required String link,
  // }) async {
  //   http.Response newResponse =
  //       await http.get(Uri.parse('https://ecommerce.salmanbediya.com/$link'));
  //   clasObjetc = Product.fromJson(jsonDecode(newResponse.body));
  // }

  Future<void> getReviews({required String reviewsID}) async {
    http.Response newResponse = await http.get(Uri.parse(
        'https://ecommerce.salmanbediya.com/products/review/get/$reviewsID'));
    review = Review.fromJson(jsonDecode(newResponse.body));
    print('------Funcation Call Hogya--------lenght=${review.reviews?.length}');
  }
}
