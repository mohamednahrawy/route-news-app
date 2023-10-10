import 'package:flutter/material.dart';
import 'package:route_news_project/my_theme.dart';

import 'Home/home_page.dart';
import 'category/category_details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: CategoryDetailsPage.routeName,
        theme: MyTheme.lightTheme,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          CategoryDetailsPage.routeName: (context) =>
              const CategoryDetailsPage(),
        });

  }
}

