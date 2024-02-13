import 'package:flutter/material.dart';
import 'package:myapp/utils/routes_utils.dart';
import 'package:myapp/view/screen/detail_page.dart';
import 'package:myapp/view/screen/home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        MyRoutes.homePage: (context) => const HomePage(),
        MyRoutes.detailPage: (context) => const DetailPage(),
        // MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
