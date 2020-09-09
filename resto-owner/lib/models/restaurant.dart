import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const RATES = "rates";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const USER_LIKES = "userLikes";

  int _id;
  String _name;
  String _image;
  List<String> _userLikes;
  double _rating;
  double _avgPrice;
  bool _popular;
  int _rates;

//  getters
  int get id => _id;

  String get name => _name;

  String get image => _image;

  List<String> get userLikes => _userLikes;

  double get avgPrice => _avgPrice;

  double get rating => _rating;

  bool get popular => _popular;

  int get rates => _rates;

  // public variable
  bool liked = false;

  RestaurantModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _name = map[NAME];
    _avgPrice = map[AVG_PRICE];
    _rating = map[RATING];
    _image = map[IMAGE];
    _popular = map[POPULAR];
  }

  RestaurantModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
