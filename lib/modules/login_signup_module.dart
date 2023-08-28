import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../screens/initial_screens/log_in_screen.dart';

class Login {
  String? message;
  Data? data;

  Login({this.message, this.data});

  Login.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? image;
  String? email;
  String? dateModified;
  String? dateCreated;

  Data(
      {this.id,
      this.name,
      this.image,
      this.email,
      this.dateModified,
      this.dateCreated});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    dateModified = json['date_modified'];
    dateCreated = json['date_created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['date_modified'] = this.dateModified;
    data['date_created'] = this.dateCreated;
    return data;
  }
}

class LogInModules {
  Future<void> saveLogin(bool isUserLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLogin', isUserLogin);
    //  Map<String,dynamic> logininMap= lo\
  }

  Future<void> saveUserDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Map<String, dynamic> loginMap = login.toJson();
    await prefs.setString('Login', json.encode(login.toJson()));
  }
  // Future<void> getLoginData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isUserLogin = prefs.getBool('isUserLogin') ?? false;
  // }

  // Future<void> getUserDetails() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //pref.getString return string type data in jeson format, firts we encode this jason to key value map than we convert this map to the class type object
  //   login = Login.fromJson(jsonDecode(prefs.getString('Login').toString()));
  //   print('dekh by data praa hy email ${login.data?.email}');
  // }
}

class AddReviewModule {
  void addReview(String user, product, rating, review) {
    Future<void> addReview() async {
      // try{} what coed we put inside of tray will execut if there is an errror
      // catch(e){} the error will be cathc in 'e' and the we would do perform acton with e like to print it or show it on screen
      try {
        http.Response response = await http.post(
            //post api is to post data on server
            //http.post need twoperametres to work
            //01 is uri/url to post data on it
            //02 the body/data what to post on the server
            Uri.parse('https://ecommerce.salmanbediya.com/products/review/add'),
            body: {
              'user': user,
              'product': product,
              'rating': rating,
              'review': review,
            });
        print('-----------statusCode= $response.statusCode------------');
      } catch (eror) {
        print('Error Error Error $eror');
      }
    }
  }
}
