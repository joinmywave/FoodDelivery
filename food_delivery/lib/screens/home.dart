import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/screen_navigation.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/providers/auth.dart';
import 'package:food_delivery/screens/login_screen.dart';
import 'package:food_delivery/widgets/botttom_navigation_icon.dart';
import 'package:food_delivery/widgets/categories.dart';
import 'package:food_delivery/widgets/custom_text.dart';
import 'package:food_delivery/widgets/featured_food.dart';
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
              onTap: () {},
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
      body: SafeArea(
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
                      decoration: InputDecoration(
                          hintText: "Find food and restaurant",
                          border: InputBorder.none),
                    ),
                    trailing: Icon(
                      Icons.filter_list,
                      color: Colors.red,
                    ),
                  )),
            ),
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
            FeaturedFood(),
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
                    navigateTo(context, Cart());
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
