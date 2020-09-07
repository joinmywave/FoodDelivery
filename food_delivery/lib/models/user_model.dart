import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/cart_Item.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "uid";
  static const FAVOURITE_FOOD = "favouriteFood";
  static const FAVOURITE_RESTAURANT = "favouriteRestaurant";
  static const CART = "cart";
  String _name;
  String _email;
  String _id;
  List _favouriteFood;
  List _favouriteRestaurant;
  double _priceSum = 0;
  int _quantitySum = 0;
  //  public variable
  List<CartItemModel> cart;
  double totalCartPrice;

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
    cart = _convertCartItems(map[CART] ?? []);
    totalCartPrice = map[CART] == null ? 0 : getTotalPrice(cart: map[CART]);
  }

  double getTotalPrice({List cart}) {
    if (cart == null) {
      return 0;
    }
    for (Map cartItem in cart) {
      _priceSum += cartItem["price"] * cartItem["quantity"];
      _quantitySum += cartItem["quantity"];
    }

    double total = _priceSum;

    return total;
  }

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  UserModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
