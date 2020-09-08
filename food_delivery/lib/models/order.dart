import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/cart_Item.dart';

class OrderModel {
  static const ID = "Id";
  static const DESCRIPTION = "description";
  static const PRODUCT_ID = "productId";
  static const User_ID = "usrId";
  static const ORDER_TOTAL = "orderTotal";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const CART = "cart";
  List<CartItemModel> cart;
  String id;
  String description;
  String productId;
  String userId;
  double orderTotal;
  String status;
  DateTime createdAt;
  List<Map<String, dynamic>> get cartMapped => _convertCartListToMap();
  OrderModel(
      {this.id,
      this.description,
      this.productId,
      this.userId,
      this.orderTotal,
      this.status,
      this.createdAt,
      this.cart});

//  getters

  OrderModel.fromMap(Map<String, dynamic> map) {
    id = map[ID];
    description = map[DESCRIPTION];
    productId = map[PRODUCT_ID];
    userId = map[User_ID];
    orderTotal = map[ORDER_TOTAL];
    status = map[STATUS];
    cart = _convertCartItems(map[CART] ?? []);
    createdAt = map[CREATED_AT];
  }

  OrderModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());

  List<CartItemModel> _convertCartItems(List cart) {
    List<CartItemModel> convertedCart = [];
    for (Map cartItem in cart) {
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  List<Map<String, dynamic>> _convertCartListToMap() {
    List<Map<String, dynamic>> cartmaplist = [];

    for (CartItemModel cartItem in cart) {
      cartmaplist.add(cartItem.toMap());
    }
    return cartmaplist;
  }

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      DESCRIPTION: description,
      PRODUCT_ID: productId,
      User_ID: userId,
      ORDER_TOTAL: orderTotal,
      STATUS: status,
      CREATED_AT: createdAt,
      CART: cartMapped
    };
  }
}
