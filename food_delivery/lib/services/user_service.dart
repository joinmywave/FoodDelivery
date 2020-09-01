import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/user_model.dart';

class UserServices {
  String collection = "users";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createUser(Map<String, dynamic> user) {
    _firestore.collection(collection).doc(user["id"]).set(user);
  }

  void updateUserData(Map<String, dynamic> user) {
    _firestore.collection(collection).doc(user["id"]).update(user);
  }

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });
}
