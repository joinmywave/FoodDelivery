import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const DESCRIPTION = "description";
  static const IMAGE = "image";
  static const RATING = "rating";
  static const PRICE = "price";
  static const RESTAURANTID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const CATEGORY = "category";
  static const FEATURED = "featured";

  int _id;
  String _name;
  String _description;
  String _image;
  double _price;
  double _rating;
  int _restaurantId;
  String _restaurant;
  String _category;
  bool _featured;
  bool favourite;
//  getters
  int get id => _id;
  String get name => _name;
  String get description => _description;
  String get image => _image;
  double get price => _price;
  double get rating => _rating;
  int get restaurantId => _restaurantId;
  String get restaurant => _restaurant;
  String get category => _category;
  bool get featured => _featured;

  ProductModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _name = map[NAME];
    _description = map[DESCRIPTION];
    _image = map[IMAGE];
    _price = map[PRICE];
    _rating = map[RATING];
    _restaurantId = map[RESTAURANTID];
    _restaurant = map[RESTAURANT];
    _category = map[CATEGORY];
    _featured = map[FEATURED];
  }

  ProductModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
