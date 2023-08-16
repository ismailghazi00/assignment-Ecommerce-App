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

//   //this is the way we est data to SheredPrefrences/save data to local mamory
//   Future<void> setData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList();
//   }
// //this is the way we Get data form SheredPrefrences/get  data from local mamory
//   Future<void> getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String>? todoInString = prefs.getStringList('todo_list');
//     convertStringListInToTodoList(todoInString ?? []);
//     print('TodoList lenght in GetData Funcation ${todoList.length}');
//   }
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
