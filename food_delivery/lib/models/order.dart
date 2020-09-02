import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const PRODUCT_ID = "productId";
  static const User_ID = "usrId";
  static const ORDER_TOTAL = "orderTotal";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";

  String _id;
  String _description;
  String _productId;
  String _userId;
  double _orderTotal;
  String _status;
  int _createdAt;

//  getters
  String get id => _id;
  String get description => _description;
  String get productId => _productId;
  String get userId => _userId;
  double get orderTotal => _orderTotal;
  String get status => _status;
  int get createdAt => _createdAt;

  OrderModel.fromMap(Map<String, dynamic> map) {
    _id = map[ID];
    _description = map[DESCRIPTION];
    _productId = map[PRODUCT_ID];
    _userId = map[User_ID];
    _orderTotal = map[ORDER_TOTAL];
    _status = map[STATUS];
    _createdAt = map[CREATED_AT];
  }

  OrderModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data());
}
