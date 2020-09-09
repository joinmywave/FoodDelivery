import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const RESTAURANT_ID = "restaurantId";
  static const RESTAURANT = "restaurant";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const RATES = "rates";
  static const USER_LIKES = "userLikes";

  String _id;
  String _name;
  int _restaurantId;
  String _restaurant;
  String _category;
  String _image;
  String _description;

  double _rating;
  int _price;
  int _rates;

  bool _featured;

  String get id => _id;

  String get name => _name;

  String get restaurant => _restaurant;

  int get restaurantId => _restaurantId;

  String get category => _category;

  String get description => _description;

  String get image => _image;

  double get rating => _rating;

  int get price => _price;

  bool get featured => _featured;

  int get rates => _rates;

  // public variable
  bool liked = false;

  ProductModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _name = map[NAME];
    _description = map[DESCRIPTION];
    _image = map[IMAGE];
    _price = map[PRICE];
    _rating = map[RATING];
    _restaurantId = map[RESTAURANT_ID];
    _restaurant = map[RESTAURANT];
    _category = map[CATEGORY];
    _featured = map[FEATURED];
  }

  ProductModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
