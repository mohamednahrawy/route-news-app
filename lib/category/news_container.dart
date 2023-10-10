import 'package:flutter/material.dart';
import 'package:route_news_project/api/api_manager.dart';

import '../models/NewsResponse.dart';
import '../models/SourceResponse.dart';

class NewsContainer extends StatelessWidget {
  final Source source;

  const NewsContainer({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ));
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                const Text('something went wrong'),
                ElevatedButton(onPressed: () {}, child: const Text('Try again'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot?.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text('Try again'))
              ],
            );
          } else {
            var newsList = snapshot.data?.articles ?? [];
            return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Text(newsList[index]?.title ?? '');
                });
          }
        });
  }
}
