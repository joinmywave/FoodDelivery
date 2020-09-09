import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const PRODUCT_ID = "productId";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const QUANTITY = "quantity";

  static const RESTAURANT_ID = "restaurantId";
  static const TOTAL_RESTAURANT_SALES = "totalRestaurantSale";

  String _id;
  String _name;
  int _productId;
  String _image;
  int _restaurantId;
  double _totalRestaurantSale;
  int quantity;
  double _price;

//  getters
  String get id => _id;
  String get name => _name;
  int get productId => _productId;
  String get image => _image;
  int get restaurantId => _restaurantId;
  double get price => _price;
  double get totalRestaurantSale => _totalRestaurantSale;

  CartItemModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _name = map[NAME];
    _productId = map[PRODUCT_ID];
    _image = map[IMAGE];
    _price = map[PRICE];
    quantity = map[QUANTITY];
    _totalRestaurantSale = map[TOTAL_RESTAURANT_SALES];
    _restaurantId = map[RESTAURANT_ID];
  }

  CartItemModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());

  Map<String, dynamic> toMap() => {
        ID: _id,
        IMAGE: _image,
        NAME: _name,
        PRODUCT_ID: _productId,
        QUANTITY: quantity,
        PRICE: _price,
        RESTAURANT_ID: _restaurantId,
        TOTAL_RESTAURANT_SALES: _totalRestaurantSale
      };
}
