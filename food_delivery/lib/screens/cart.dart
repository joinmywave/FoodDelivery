import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/models/product.dart';
import 'package:food_delivery/widgets/custom_text.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: black,
          ),
          onPressed: null,
        ),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
          text: "Shopping Bag",
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "images/shopping-bag.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                Positioned(
                  right: 7,
                  bottom: 5,
                  child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: Offset(2, 1),
                              blurRadius: 3,
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: CustomText(
                          text: "2",
                          color: red,
                          size: 16,
                          weight: FontWeight.bold,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                  text: "Your Food Cart",
                  size: 20,
                  weight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red[50],
                              offset: Offset(3, 5),
                              blurRadius: 30),
                        ],
                      ),
                      child: CustomListItem(
                        thumbnail: Image.asset(
                          "images/${product.image}",
                          height: 120,
                          width: 120,
                        ),
                        title: product.name,
                        price: "\$" + product.price.toString(),
                        quantity: 2,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListItem extends StatelessWidget {
  const CustomListItem({
    this.thumbnail,
    this.title,
    this.price,
    this.quantity,
  });

  final Widget thumbnail;
  final String title;
  final String price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: thumbnail,
          ),
          Expanded(
            flex: 3,
            child: _ProductDescription(
              title: title,
              price: price,
              quantity: quantity,
            ),
          ),
          const IconButton(
            icon: Icon(Icons.delete),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({
    Key key,
    this.title,
    this.price,
    this.quantity,
  }) : super(key: key);

  final String title;
  final String price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            price,
            style: const TextStyle(fontSize: 15.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$quantity quantity',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
