import 'package:flutter/material.dart';
import 'package:route_news_project/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  final Function onDrawerItemClick;

  const HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * .075),
            //width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Text(
              'News App',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: MyTheme.whiteColor),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClick(HomeDrawer.categories);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const ImageIcon(
                      AssetImage('assets/images/categories_icon.png')),
                  const SizedBox(width: 20),
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onDrawerItemClick(HomeDrawer.settings);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  const ImageIcon(
                      AssetImage('assets/images/settings_icon.png')),
                  const SizedBox(width: 20),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.titleLarge,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
