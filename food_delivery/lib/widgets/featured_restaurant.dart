import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/providers/restaurant.dart';
import 'package:food_delivery/widgets/restaurant.dart';
import 'package:provider/provider.dart';

import 'custom_text.dart';

class FeaturedRestaurant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: "Featured Restaurant",
              size: 20,
              color: grey,
            ),
          ),
          Column(
            children: restaurantProvider.restaurants
                .map((restaurant) => GestureDetector(
                      child: RestaurantWidget(
                        restaurant: restaurant,
                      ),
                      onTap: () {},
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
