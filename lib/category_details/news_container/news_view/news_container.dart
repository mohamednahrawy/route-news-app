import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_news_project/category_details/tab_container/cubit/states.dart';

import '../../../models/SourceResponse.dart';
import '../cubit/news_container_view_model.dart';
import '../cubit/states.dart';
import '../repository/news_repository.dart';
import 'news_item.dart';

class NewsContainer extends StatefulWidget {
  final Source source;

  const NewsContainer({super.key, required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel(
      newsRepositoryContract: injectNewsRepositoryContract());

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsContainerViewModel, NewsStates>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceLoadingState) {
            return Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor));
          } else if (state is NewsErrorState) {
            return Text(state.errorMessage);
          } else if (state is NewsSuccessState) {
            return ListView.builder(
                itemCount: state.newsList.length,
                itemBuilder: (context, index) {
                  return Expanded(
                      child: NewsItem(article: state.newsList[index]));
                });
          } else {
            return Container();
          }
        });
  }
}
