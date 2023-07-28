import 'package:flutter/material.dart';
import 'package:food_app/pages/Cartpage.dart';
import 'package:food_app/pages/HomePage.dart';
import 'package:food_app/Admin/AddProduct.dart';
import 'package:food_app/pages/Wishlist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Splash(),
      initialRoute: '/',
      routes: {
        "/" : (context) => const HomePage(),
        "CartPage":(context) => CartPage(),
        "Wishlist":(context) => const WishList(),
        "AddProduct" : (context) => AddProduct(),
      },
    );
  }
}