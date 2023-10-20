import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/SourceResponse.dart';
import 'news_container_view_model.dart';
import 'news_item.dart';

class NewsContainer extends StatefulWidget {
  final Source source;

  const NewsContainer({super.key, required this.source});

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsContainerViewModel viewModel = NewsContainerViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

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
                  child: const Text('Try Again'))
            ],
          );
        } else if (viewModel.articlesList == null) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        } else {
          return ListView.builder(
              itemCount: viewModel.articlesList?.length ?? 0,
              itemBuilder: (context, index) {
                return NewsItem(article: viewModel.articlesList![index]);
              });
        }
      }),
    );
  }
}
