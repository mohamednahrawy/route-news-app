import 'package:flutter/material.dart';

import '../models/category.dart';
import 'category_item.dart';

class CategoriesView extends StatelessWidget {
  final List categoriesList = Category.getCategory();
  final Function onTab;

  /// make all Function and shape it inside the onTab

  CategoriesView({super.key, required this.onTab});

  @override
  Widget build(BuildContext context) {
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
              itemCount: categoriesList.length,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onTab(categoriesList[index]);

                    /// execute the function and I sent the category with it
                  },
                  child: CategoryItem(
                      category: categoriesList[index], index: index))),
        )
      ]),
    );
  }
}
