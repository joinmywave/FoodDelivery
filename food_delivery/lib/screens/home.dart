import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/screen_navigation.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/providers/app.dart';
import 'package:food_delivery/providers/auth.dart';
import 'package:food_delivery/providers/product.dart';
import 'package:food_delivery/providers/restaurant.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:food_delivery/screens/order.dart';
import 'package:food_delivery/screens/product_Search.dart';
import 'package:food_delivery/screens/restaurants_search.dart';
import 'package:food_delivery/widgets/botttom_navigation_icon.dart';
import 'package:food_delivery/widgets/categories.dart';
import 'package:food_delivery/widgets/custom_text.dart';
import 'package:food_delivery/widgets/featured_restaurant.dart';
import 'package:food_delivery/widgets/loading.dart';
import 'package:food_delivery/widgets/popular_food.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        elevation: 0.5,
        title: CustomText(text: "Food Deliver App"),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  navigateTo(context, CartScreen());
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primary),
              accountName: CustomText(
                text: authProvider.userModel?.name,
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: authProvider.userModel?.email,
                color: white,
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home),
              title: CustomText(text: "Home"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.fastfood),
              title: CustomText(text: "Favourite Food"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.restaurant),
              title: CustomText(text: "Favourite restaurants"),
            ),
            ListTile(
              onTap: () async {
                await authProvider.getOrders();
                navigateTo(context, OrdersScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: CustomText(text: "Settings"),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: appProvider.isLoading
          ? Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Loading(),
                ],
              ),
            )
          : SafeArea(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText(
                          text: "What would you like to eat?",
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[400],
                              offset: Offset(1, 1),
                              blurRadius: 4),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          Icons.search,
                          color: Colors.red,
                        ),
                        title: TextField(
                          onSubmitted: (pattern) async {
                            appProvider.changeLoading();
                            if (appProvider.search == SearchBy.PRODUCTS) {
                              await productProvider.search(pattern);
                              navigateTo(context, ProductSearchScreen());
                            } else {
                              await restaurantProvider.search(pattern);
                              navigateTo(context, RestaurantsSearchScreen());
                            }
                            appProvider.changeLoading();
                          },
                          decoration: InputDecoration(
                              hintText: "Find food and restaurant",
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CustomText(
                        text: "Search by:",
                        color: grey,
                        weight: FontWeight.w300,
                      ),
                      DropdownButton<String>(
                        value: appProvider.filterBy,
                        style: TextStyle(
                            color: primary, fontWeight: FontWeight.w300),
                        icon: Icon(
                          Icons.filter_list,
                          color: primary,
                        ),
                        elevation: 0,
                        onChanged: (value) {
                          if (value == "Products") {
                            appProvider.changeSearchBy(
                                newSearchBy: SearchBy.PRODUCTS);
                          } else {
                            appProvider.changeSearchBy(
                                newSearchBy: SearchBy.RESTAURANTS);
                          }
                        },
                        items: <String>["Products", "Restaurants"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                      ),
                    ],
                  ),
                  Divider(),
                  SizedBox(
                    height: 5,
                  ),
                  Categories(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: "Popular Foods",
                      size: 20,
                      color: grey,
                    ),
                  ),
                  PopularFood(),
                  FeaturedRestaurant(),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        height: 85,
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavIcon(
                image: "home.png",
                name: "Home",
              ),
              BottomNavIcon(image: "target.png", name: "Near By"),
              BottomNavIcon(
                  image: "shopping-bag.png",
                  name: "Bag",
                  onTap: () {
                    navigateTo(context, CartScreen());
                  }),
              BottomNavIcon(
                image: "avatar.png",
                name: "Account",
                onTap: () {
                  navigateTo(context, LoginScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
