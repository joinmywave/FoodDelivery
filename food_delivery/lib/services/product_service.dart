import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/models/product.dart';

class ProductService {
  String collection = "products";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createProduct(Map<String, dynamic> product) {
    _firestore.collection(collection).doc(product["id"]).set(product);
  }

  void updateProductData(Map<String, dynamic> product) {
    _firestore.collection(collection).doc(product["id"]).update(product);
  }

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).get().then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<ProductModel> getProductById(String id) =>
      _firestore.collection(collection).doc(id).get().then((doc) {
        return ProductModel.fromSnapshot(doc);
      });
  Future<List<ProductModel>> getProductsByRestaurant({int id}) async =>
      _firestore
          .collection(collection)
          .where("restaurantId", isEqualTo: id)
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });

  Future<List<ProductModel>> getProductsOfCategory({String category}) async =>
      _firestore
          .collection(collection)
          .where("category", isEqualTo: category)
          .get()
          .then((result) {
        List<ProductModel> products = [];
        for (DocumentSnapshot product in result.docs) {
          products.add(ProductModel.fromSnapshot(product));
        }
        return products;
      });
  Future<List<ProductModel>> searchProducts({String productName}) {
    String searchkey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchkey])
        .endAt([searchkey + '\uf8ff'])
        .get()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.docs) {
            products.add(ProductModel.fromSnapshot(product));
          }
          return products;
        });
  }
}
