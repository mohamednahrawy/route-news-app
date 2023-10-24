import 'package:flutter/material.dart';
import 'package:route_news_project/article_detaling/article_detailing_view.dart';
import 'package:route_news_project/my_theme.dart';

import 'Home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeName,
        theme: MyTheme.lightTheme,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          ArticleDetailingView.routeName: (context) =>
              const ArticleDetailingView(),
        });

  }
}

