import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/models/category.dart';
import 'package:food_delivery/providers/category.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'custom_text.dart';
import 'loading.dart';

List<CategoryModel> categoriesList = [];

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryProvider.categories.length,
        itemBuilder: (_, index) {
          CategoryModel category = categoryProvider.categories[index];
          return Padding(
            padding: const EdgeInsets.all(6),
            child: Stack(
              children: <Widget>[
                Container(
                  width: 140,
                  height: 160,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                              child: Align(
                            alignment: Alignment.center,
                            child: Loading(),
                          )),
                          Center(
                            child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: category.image),
                          )
                        ],
                      )),
                ),
                Container(
                  width: 140,
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.025),
                        ],
                      )),
                ),
                Positioned.fill(
                    child: Align(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: category.name,
                          color: white,
                          size: 26,
                          weight: FontWeight.w300,
                        )))
              ],
            ),
          );
        },
      ),
    );
  }
}
