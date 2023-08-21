class Review {
  List<Reviews>? reviews;

  Review({this.reviews});

  Review.fromJson(Map<String, dynamic> json) {
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? id;
  RProduct? product;
  User? user;
  String? rating;
  String? review;
  String? dateModified;
  String? dateCreated;

  Reviews(
      {this.id,
      this.product,
      this.user,
      this.rating,
      this.review,
      this.dateModified,
      this.dateCreated});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? new RProduct.fromJson(json['product']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    rating = json['rating'];
    review = json['review'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['date_modified'] = this.dateModified;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class RProduct {
  String? id;
  Category? category;
  Category? tag;
  String? name;
  String? price;
  String? description;
  String? image;
  String? rating;
  int? reviews;
  String? dateModified;
  String? dateCreated;

  RProduct(
      {this.id,
      this.category,
      this.tag,
      this.name,
      this.price,
      this.description,
      this.image,
      this.rating,
      this.reviews,
      this.dateModified,
      this.dateCreated});

  RProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    tag = json['tag'] != null ? new Category.fromJson(json['tag']) : null;
    name = json['name'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    rating = json['rating'];
    reviews = json['reviews'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.tag != null) {
      data['tag'] = this.tag!.toJson();
    }
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['image'] = this.image;
    data['rating'] = this.rating;
    data['reviews'] = this.reviews;
    data['date_modified'] = this.dateModified;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? image;
  String? dateModified;
  String? dateCreated;

  Category(
      {this.id, this.name, this.image, this.dateModified, this.dateCreated});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date_modified'] = this.dateModified;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class User {
  String? id;
  String? name;
  Null? image;
  String? email;
  String? password;
  String? dateModified;
  String? dateCreated;

  User(
      {this.id,
      this.name,
      this.image,
      this.email,
      this.password,
      this.dateModified,
      this.dateCreated});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    password = json['password'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['password'] = this.password;
    data['date_modified'] = this.dateModified;
    data['date_created'] = this.dateCreated;
    return data;
  }
}
