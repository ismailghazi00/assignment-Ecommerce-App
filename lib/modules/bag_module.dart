class BagModule {
  List<BagProduct> bagProductList = [];
  void addTobag(
      String? iD, String? name, String? image, String? price, String? count) {
    bagProductList.add(BagProduct(
        productID: iD,
        productImage: image,
        productPrice: price,
        productname: name,
        productCount: count));
  }

  void removeDuplication() {
    List<BagProduct> uniqueList = bagProductList.toSet().toList();
    // bagProductList.retainWhere((x) => uniqueList.remove(x.productID));

    // List<BagProduct> uniqueList = bagProductList
    //     .whereWithIndex((element, index) =>
    //         bagProductList.indexWhere((element2) => element2.productID == element.productID) ==
    //         index)
    //     .toList();
    bagProductList = uniqueList;
    print('Duplicat Funcation Call hogya');
    // uniqueList.forEach((element) => print(element.toJson()));
  }

  void removeFromBag(index) {
    bagProductList.removeAt(index);
  }
}

class BagProduct {
  String? productID;
  String? productname;
  String? productImage;
  String? productPrice;
  String? productCount;

  BagProduct(
      {this.productID,
      this.productImage,
      this.productPrice,
      this.productname,
      this.productCount});
}
