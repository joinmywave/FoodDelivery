import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_text.dart';

class BottomNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  const BottomNavIcon({this.image, this.name, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? null,
      child: Column(
        children: [
          Image.asset(
            "images/$image",
            width: 26,
            height: 26,
          ),
          SizedBox(height: 2),
          CustomText(text: name)
        ],
      ),
    );
  }
}
