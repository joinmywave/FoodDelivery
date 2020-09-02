import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/screen_navigation.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/screens/product_details.dart';
import 'package:food_delivery/widgets/custom_text.dart';

List<ProductModel> productList = [];

class PopularFood extends StatelessWidget {
  const PopularFood({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12, 14, 16, 12),
            child: GestureDetector(
              onTap: () {
                navigateTo(_, ProductDetails(product: productList[index]));
              },
              child: Container(
                height: 220,
                width: 200,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red[50],
                        offset: Offset(15, 5),
                        blurRadius: 30),
                  ],
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "images/${productList[index].image}",
                      height: 140,
                      width: 140,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(text: "${productList[index].name}"),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[300],
                                    offset: Offset(1, 1),
                                    blurRadius: 4),
                              ],
                            ),
                            child: Icon(
                              productList[index].favourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: red,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CustomText(
                                    text: productList[index].rating.toString(),
                                    color: grey,
                                    size: 14),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: red,
                                  size: 16,
                                ),
                                Icon(
                                  Icons.star,
                                  color: grey,
                                  size: 16,
                                ),
                              ],
                            ),
                            CustomText(
                              text: "\$${productList[index].price}",
                              weight: FontWeight.bold,
                            ),
                          ]),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
