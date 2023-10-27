import 'package:flutter/material.dart';
import 'package:route_news_project/models/NewsResponse.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleDetailingView extends StatefulWidget {
  static const routeName = 'Article-detailing-view';

  const ArticleDetailingView({super.key});

  @override
  State<ArticleDetailingView> createState() => _ArticleDetailingViewState();
}

class _ArticleDetailingViewState extends State<ArticleDetailingView> {
  late DateTime timeAgo;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Article;
    timeAgo = DateTime.parse(args.publishedAt ?? '');
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Expanded(child: Image.network(args.urlToImage ?? '')),
          Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    args.source?.name ?? '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    args.title ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(timeago.format(timeAgo, allowFromNow: true),
                      textAlign: TextAlign.right),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .26,
                    color: Colors.orange,
                    child: Text(
                      args.content ?? '',
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(height: 1.5),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'View full Article',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.arrow_right)
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ))
        ]),
      ),
    );
  }
}
