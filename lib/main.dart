import 'package:flutter/material.dart';
import 'package:store/Screens/Home_page.dart';
import 'package:store/Screens/Update_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "HomePage": (context) => HomePage(),
        "UpdateProduct": (context) => UpdateProduct(),
      },

      home: HomePage(),
    );
  }
}
