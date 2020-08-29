import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/custom_text.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 300,
              child: Carousel(
                images: [
                  AssetImage('images/${widget.product.image}'),
                  AssetImage('images/${widget.product.image}'),
                  AssetImage('images/${widget.product.image}')
                ],
                dotBgColor: white,
                dotColor: grey,
                dotIncreasedColor: red,
                dotIncreaseSize: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
