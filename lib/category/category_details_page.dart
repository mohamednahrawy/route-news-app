import 'package:flutter/material.dart';
import 'package:route_news_project/api/api_manager.dart';
import 'package:route_news_project/category/tab_container.dart';

import '../models/SourceResponse.dart';

class CategoryDetailsPage extends StatelessWidget {
  static const String routeName = 'category-details';

  const CategoryDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('News App'),
      ),
      body: FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(),
        builder: (context, snapshot) {
          /// loading, error or Data
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Column(
              children: [
                const Text('something went wrong'),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            );
          }
          if (snapshot.data?.status != 'ok') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            );
          } else {
            var sourcesList = snapshot.data?.sources ?? [];
            return TabContainer(sourcesList: sourcesList);
          }
        },
      ),
    );
  }
}
