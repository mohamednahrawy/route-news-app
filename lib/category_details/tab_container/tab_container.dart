import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_project/category_details/tab_container/cubit/tab_container_view_model.dart';
import 'package:route_news_project/category_details/tab_container/tab_item.dart';

import '../../models/category.dart';
import '../cubit/states.dart';
import '../news_container/news_container.dart';

class TabContainer extends StatefulWidget {
  final Category? category;

  const TabContainer({super.key, required this.category});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  TabContainerViewModel viewModel = TabContainerViewModel();
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourceByCategoryId(widget.category!.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabContainerViewModel, SourceStates>(
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
            return DefaultTabController(
                length: state.sourceList.length,
                child: Column(children: [
                  TabBar(
                      isScrollable: true,
                      indicatorColor: Colors.transparent,
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {});
                      },
                      tabs: state.sourceList
                          .map((source) => TabItem(
                              isSelected: selectedIndex ==
                                  state.sourceList.indexOf(source),
                              source: source))
                          .toList()),
                  NewsContainer(
                    source: state.sourceList[selectedIndex],
                  )
                ]));
          } else {
            return Container();
          }
        });
  }
}
