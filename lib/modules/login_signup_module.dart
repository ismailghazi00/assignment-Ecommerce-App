import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool isUserLogin = false;
  Future<void> saveLogin(bool isUserLogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isUserLogin', isUserLogin);
    print(
        '-------------------------------------save funcation call ho gaya log in boolll ${isUserLogin}');
  }

  Future<void> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isUserLogin = prefs.getBool('isUserLogin') ?? false;
    print(
        '-------------------------------------get funcation call ho gaya log in boolll ${isUserLogin}');
  }
}
