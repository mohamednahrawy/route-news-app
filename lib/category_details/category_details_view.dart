import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_news_project/category_details/tab_container/tab_container.dart';

import '../models/category.dart';
import 'cubit/category_details_view_model.dart';

class CategoryDetailsView extends StatefulWidget {
  static const String routeName = 'category-details';
  final Category category;

  const CategoryDetailsView({super.key, required this.category});

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    viewModel.getSource();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<CategoryDetailsViewModel>(
            child: const Text('Header'),
            ///Template parameter is type of viewModel
            builder: (context, viewModel, child) {
              if (viewModel.errorMessage != null) {
                return Column(
                  children: [
                    child!,
                    Text(viewModel.errorMessage ?? ''),
                    ElevatedButton(
                        onPressed: () {
                          viewModel.getSource();
                        },
                        child: const Text('Try Again'))
                  ],
                );
              } else if (viewModel.sourcesList == null) {
                return Center(
                    child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor));
              } else {
                return TabContainer(category: widget.category);
              }
            }));
  }
}
