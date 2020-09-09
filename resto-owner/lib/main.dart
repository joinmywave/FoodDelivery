import 'package:flutter/material.dart';
import 'package:food_delivery/screens/dashboart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food App Admin',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: DashboardScreen());
  }
}
