import 'package:flutter/material.dart';
import 'package:route_news_project/Home/home_drawer.dart';
import 'package:route_news_project/category_details/tab_container/tabs_view/category_details_view.dart';
import 'package:route_news_project/settings/settings_tab.dart';

import '../categories/categories_container.dart';
import '../models/category.dart';
import '../my_theme.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home-page';
  int selectedDrawerItem = HomeDrawer.categories;

  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Category? selectedCategory;

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
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        body: widget.selectedDrawerItem == HomeDrawer.settings
            ? const SettingsTab()
            : selectedCategory == null
            ? CategoriesView(onTab: onCategoryClick)
            : CategoryDetailsView(category: selectedCategory!),
      )
    ]);
  }

  void onCategoryClick(Category newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedCategory = null;
    widget.selectedDrawerItem = newSelectedDrawerItem;
    Navigator.pop(context);
    setState(() {});
  }

  buildAppBar() =>
      AppBar(
        centerTitle: true,
        title: Text(
          widget.selectedDrawerItem == HomeDrawer.settings
              ? 'Settings'
              : selectedCategory == null
              ? 'Categories'
              : selectedCategory!.title,
          style: Theme
              .of(context)
              .textTheme
              .titleLarge,
        ),
      );

  buildDrawer() =>
      Drawer(
          child: HomeDrawer(
            onDrawerItemClick: onDrawerItemClick,
          ));
}
