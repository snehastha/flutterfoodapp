import 'package:flutter/material.dart';
import 'package:flutter_foodapp/src/screens/home.dart';
import 'package:flutter_foodapp/src/screens/login.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home:LoginScreen(),
    );
  }
}

