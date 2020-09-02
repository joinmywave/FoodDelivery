import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const FAVOURITE_FOOD = "favouriteFood";
  static const FAVOURITE_RESTAURANT = "favouriteRestaurant";

  String _name;
  String _email;
  String _id;
  List _favouriteFood;
  List _favouriteRestaurant;

//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  List get favouriteFood => _favouriteFood;
  List get favouriteRestaurant => _favouriteRestaurant;

  UserModel.fromMap(Map<String, dynamic> map) {
    _name = map[NAME];
    _email = map[EMAIL];
    _id = map[ID];
    _favouriteFood = map[FAVOURITE_FOOD] ?? [];
    _favouriteRestaurant = map[FAVOURITE_RESTAURANT] ?? [];
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
