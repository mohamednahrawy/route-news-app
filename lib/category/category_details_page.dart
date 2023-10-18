import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_news_project/category/category_details_view_model.dart';
import 'package:route_news_project/category_details/tab_container.dart';

class CategoryDetailsPage extends StatefulWidget {
  static const String routeName = 'category-details';

  const CategoryDetailsPage({super.key});

  @override
  State<CategoryDetailsPage> createState() => _CategoryDetailsPageState();
}

class _CategoryDetailsPageState extends State<CategoryDetailsPage> {
  ///to create object of viewModel call the constructor of viewModel
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
                return TabContainer(sourcesList: viewModel.sourcesList ?? []);
              }
            }));
  }
}
