import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const PRODUCT_ID = "productId";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const QUANTITY = "quantity";

  String _id;
  String _name;
  String _productId;
  String _image;
  double _price;
  int _quantity;

//  getters
  String get id => _id;
  String get name => _name;
  String get productId => _productId;
  String get image => _image;
  double get price => _price;
  int get status => _quantity;

  CartItemModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _name = map[NAME];
    _productId = map[PRODUCT_ID];
    _image = map[IMAGE];
    _price = map[PRICE];
    _quantity = map[QUANTITY];
  }

  CartItemModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
