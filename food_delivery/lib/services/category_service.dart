import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/category.dart';

class CategoryService {
  String collection = "categories";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createCategory(Map<String, dynamic> category) {
    _firestore.collection(collection).doc(category["id"]).set(category);
  }

  void updateCategoryData(Map<String, dynamic> category) {
    _firestore.collection(collection).doc(category["id"]).update(category);
  }

  Future<List<CategoryModel>> getCategories() async =>
      _firestore.collection(collection).get().then((result) {
        List<CategoryModel> categories = [];
        for (DocumentSnapshot category in result.docs) {
          categories.add(CategoryModel.fromSnapshot(category));
        }
        return categories;
      });

  Future<CategoryModel> getCategoryById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return CategoryModel.fromSnapshot(doc);
      });
}
