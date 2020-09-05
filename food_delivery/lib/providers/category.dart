import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/services/category_service.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> categories = [];
  CategoryService _categoryService = CategoryService();

  CategoryProvider.initialize() {
    _loadCategories();
  }

  _loadCategories() async {
    categories = await _categoryService.getCategories();
    notifyListeners();
  }
}
