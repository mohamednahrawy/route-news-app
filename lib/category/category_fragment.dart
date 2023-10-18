import 'package:flutter/material.dart';
import 'package:route_news_project/category/category_item.dart';

import '../models/category.dart';

class CategoryFragment extends StatelessWidget {
  final List categories = Category.getCategory();

  CategoryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    //categories =  ;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          'Pick your category \nof interest',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 18),
              itemCount: categories.length,
              itemBuilder: (context, index) =>
                  CategoryItem(category: categories[index], index: index)),
        )
      ]),
    );
  }
}
