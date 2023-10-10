import 'package:flutter/material.dart';
import 'package:route_news_project/category_details/tab_item.dart';

import '../models/SourceResponse.dart';
import 'news_container.dart';

class TabContainer extends StatefulWidget {
  final List<Source> sourcesList;

  const TabContainer({super.key, required this.sourcesList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              isScrollable: true,

              /// TabBar is fixed in normal
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              tabs: widget.sourcesList
                  .map((source) => TabItem(
                      isSelected:
                          selectedIndex == widget.sourcesList.indexOf(source),
                      source: source))
                  .toList()),
          Expanded(
              child: NewsContainer(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
