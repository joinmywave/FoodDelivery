import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/models/category.dart';

import 'custom_text.dart';

List<CategoryModel> categoriesList = [];

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red[50],
                          offset: Offset(4, 6),
                          blurRadius: 20),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: Image.asset(
                      "images/${categoriesList[index].image}",
                      width: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: "${categoriesList[index].name}",
                  size: 14,
                  color: black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
