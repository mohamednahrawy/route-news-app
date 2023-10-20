import 'package:flutter/material.dart';
import 'package:route_news_project/Home/home_drawer.dart';
import 'package:route_news_project/category_details/category_details_page.dart';
import 'package:route_news_project/settings/settings_tab.dart';

import '../category/category_fragment.dart';
import '../models/category.dart';
import '../my_theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home-page';
  int selectedDrawerItem = HomeDrawer.categories;
  Category? selectedCategory;

  HomePage({super.key, this.selectedCategory});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            widget.selectedDrawerItem == HomeDrawer.settings
                ? 'Settings'
                : widget.selectedCategory == null
                    ? 'Categories'
                    : widget.selectedCategory!.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        drawer: Drawer(
            child: HomeDrawer(
          onDrawerItemClick: onDrawerItemClick,
        )),
        body: widget.selectedDrawerItem == HomeDrawer.settings
            ? const SettingsTab()
            : widget.selectedCategory == null
                ? CategoryFragment(onTab: onCategoryClick)
                : CategoryDetailsPage(),
      )
    ]);
  }

  void onCategoryClick(Category newSelectedCategory) {
    widget.selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClick(int newSelectedDrawerItem) {
    widget.selectedDrawerItem = newSelectedDrawerItem;
    Navigator.pop(context);
    setState(() {});
  }
}
