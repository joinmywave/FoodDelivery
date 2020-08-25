import 'package:flutter/material.dart';
import 'package:food_delivery/helpers/style.dart';
import 'package:food_delivery/widgets/custom_text.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Stack(children: [
                  IconButton(
                    icon: Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ])
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey[300],
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
            )
          ],
        ),
      ),
    );
  }
}
