import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/restaurant.dart';

class RestaurantService {
  String collection = "restaurants";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createRestaurant(Map<String, dynamic> restaurant) {
    _firestore.collection(collection).doc(restaurant["id"]).set(restaurant);
  }

  void updateRestaurantData(Map<String, dynamic> restaurant) {
    _firestore.collection(collection).doc(restaurant["id"]).update(restaurant);
  }

  Future<List<RestaurantModel>> getRestaurants() async =>
      _firestore.collection(collection).get().then((result) {
        List<RestaurantModel> restaurants = [];
        for (DocumentSnapshot restaurant in result.docs) {
          restaurants.add(RestaurantModel.fromSnapshot(restaurant));
        }
        return restaurants;
      });

  Future<RestaurantModel> getRestaurantById(int id) =>
      _firestore.collection(collection).doc(id.toString()).get().then((doc) {
        return RestaurantModel.fromSnapshot(doc);
      });
}
