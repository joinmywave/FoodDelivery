import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/style.dart';

import 'custom_text.dart';
import 'like_widget.dart';

class FeaturedFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: "Featured",
              size: 20,
              color: grey,
            ),
          ),
          Stack(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("images/food.jpg")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LikeWidget(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: white, borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Icon(Icons.star,
                              color: Colors.yellow[900], size: 20),
                        ),
                        Text("4.5")
                      ]),
                    ),
                  )
                ],
              ),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.05),
                          Colors.black.withOpacity(0.025),
                        ],
                      )),
                ),
              )),
              Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Pancakes with berrys \n",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "by: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w300)),
                          TextSpan(
                              text: "Pancake Hut \n",
                              style: TextStyle(fontSize: 16)),
                        ], style: TextStyle(color: white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "\$3.00 \n",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                        ], style: TextStyle(color: white)),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
