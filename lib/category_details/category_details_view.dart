import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_project/category_details/cubit/states.dart';
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
    viewModel.getSourceByCategoryId(widget.category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryDetailsViewModel, SourceStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (state is SourceErrorState) {
            return Column(
              children: [
                Text(state.errorMessage),
              ],
            );
          } else if (state is SourceSuccessState) {
            return TabContainer(
                category: widget.category, sourceList: state.sourceList);
          } else {
            return Container();
          }
        });
  }
}