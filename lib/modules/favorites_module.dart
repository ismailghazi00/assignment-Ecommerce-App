class FavModule {
  List<FavProduct> ProductList = [];
  void addToFavorite(String? iD, String? name, String? image, String? price,
      String? rating, String? reviews) {
    if (!ProductList.contains(iD)) {
      ProductList.add(FavProduct(
          productID: iD,
          productImage: image,
          productPrice: price,
          productname: name,
          rating: rating,
          reviews: reviews));
    }
  }
}

class FavProduct {
  String? productID;
  String? productname;
  String? productImage;
  String? productPrice;
  String? productCount;
  String? size;
  String? color;
  String? rating;
  String? reviews;

  FavProduct(
      {this.productID,
      this.productImage,
      this.productPrice,
      this.productname,
      this.productCount,
      this.rating,
      this.reviews});
}
