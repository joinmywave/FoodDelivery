import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const ID = "Id";
  static const NAME = "name";
  static const AVERAGEPRICE = "averagePrice";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const POPULAR = "popular";

  int _id;
  String _name;
  double _averagePrice;
  double _rating;
  String _image;
  bool _popular;

//  getters
  int get id => _id;
  String get name => _name;
  double get averagePrice => _averagePrice;
  double get rating => _rating;
  String get image => _image;
  bool get popular => _popular;

  RestaurantModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _name = map[NAME];
    _averagePrice = map[AVERAGEPRICE];
    _rating = map[RATING];
    _image = map[IMAGE];
    _popular = map[POPULAR];
  }

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
