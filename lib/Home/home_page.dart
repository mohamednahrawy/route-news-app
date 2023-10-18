import 'package:flutter/material.dart';

import '../category/category_fragment.dart';
import '../my_theme.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          )),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'News App',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: CategoryFragment(),
      )
    ]);
  }
}
