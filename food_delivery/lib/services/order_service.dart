import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/order.dart';

class OrderServices {
  String collection = "orders";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder({String id, OrderModel orderModel}) {
    _firestore.collection(collection).doc(id).set(orderModel.toMap());
  }
  //DateTime.now().millisecondsSinceEpoch,

  Future<List<OrderModel>> getUserOrders({String userId}) async => _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .get()
          .then((result) {
        List<OrderModel> orders = [];
        for (DocumentSnapshot order in result.docs) {
          orders.add(OrderModel.fromSnapshot(order));
        }
        return orders;
      });
}
