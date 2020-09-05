import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> products = [];
  List<ProductModel> productsByCategory = [];
  List<ProductModel> productsByRestaurant = [];
  ProductService _productService = ProductService();

  ProductProvider.initialize() {
    _loadProducts();
  }

  _loadProducts() async {
    products = await _productService.getProducts();
    notifyListeners();
  }

  Future loadProductsByCategory({String categoryName}) async {
    productsByCategory =
        await _productService.getProductsOfCategory(category: categoryName);
    notifyListeners();
  }

  Future loadProductsByRestaurant({int restaurantId}) async {
    productsByRestaurant =
        await _productService.getProductsByRestaurant(id: restaurantId);
    notifyListeners();
  }
}
