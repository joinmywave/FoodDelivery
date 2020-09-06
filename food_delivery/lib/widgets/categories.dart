import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/screen_navigation.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/providers/category.dart';
import 'package:food_delivery/providers/product.dart';
import 'package:food_delivery/screens/category.dart';
import 'package:provider/provider.dart';

import 'category_widget.dart';

List<CategoryModel> categoriesList = [];

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryProvider.categories.length,
          itemBuilder: (_, index) {
            CategoryModel category = categoryProvider.categories[index];
            return GestureDetector(
              onTap: () async {
                await productProvider.loadProductsByCategory(
                    categoryName: category.name);
                navigateTo(
                    context,
                    CategoryScreen(
                      categoryModel: category,
                    ));
              },
              child: CategoryWidget(
                category: category,
              ),
            );
          }),
    );
  }
}
