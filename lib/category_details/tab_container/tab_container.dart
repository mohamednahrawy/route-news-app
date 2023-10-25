import 'package:flutter/material.dart';
import 'package:route_news_project/category_details/tab_container/tab_item.dart';
import '../../models/SourceResponse.dart';
import '../../models/category.dart';
import '../news_container/news_container.dart';

class TabContainer extends StatefulWidget {
  final Category? category;
  final List<Source> sourceList;

  const TabContainer(
      {super.key, required this.category, required this.sourceList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
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
              tabs: widget.sourceList
                  .map((source) => TabItem(
                      isSelected:
                          selectedIndex == widget.sourceList.indexOf(source),
                      source: source))
                  .toList()),
          Expanded(
              child: NewsContainer(source: widget.sourceList[selectedIndex]))
        ],
      ),
    );
  }
}