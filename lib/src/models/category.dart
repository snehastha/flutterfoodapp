import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CategoryModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";

  int _id;
  String _name;
  String _image;

  //  getters
  int get id => _id;

  String get name => _name;

  String get image => _image;

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot){
    _id = snapshot.data()[ID.compareTo(ID)];
    _name = snapshot.data()[NAME];
    _image = snapshot.data()[IMAGE];
  }
}


