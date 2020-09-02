import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";

  String _id;
  String _name;
  String _image;
  String get id => _id;
  String get name => _name;
  String get image => _image;

  CategoryModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _name = map[NAME];
    _image = map[IMAGE];
  }

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
