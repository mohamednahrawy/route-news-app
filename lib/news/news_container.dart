import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:route_news_project/news/news_container_view_model.dart';

import '../models/SourceResponse.dart';

class NewsContainer extends StatefulWidget {
  final Source source;

  const NewsContainer({super.key, required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsContainerViewModel>(
          builder: (context, viewModel, child) {
        if (viewModel.errorMessage != null) {
          return Column(
            children: [
              Text(viewModel.errorMessage!),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? '');
                  },
                  child: Text('Try Again'))
            ],
          );
        } else if (viewModel.newsList == null) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else {}
      }),
    );
  }
}
