import 'package:flutter/material.dart';

import '../models/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  final Article article;

  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
              article.urlToImage ?? '',
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(article.source?.name ?? '',
                  style: Theme.of(context).textTheme.titleSmall),
              Text(
                article.title ?? '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(article.publishedAt ?? '',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.titleSmall)
            ],
          ))
        ],
      ),
    );
  }
}
