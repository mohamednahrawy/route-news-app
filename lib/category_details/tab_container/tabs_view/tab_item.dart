import 'package:flutter/material.dart';

import '../../../models/SourceResponse.dart';
import '../../../my_theme.dart';

class TabItem extends StatelessWidget {
  final bool isSelected;
  final Source source;

  const TabItem({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(width: 3, color: MyTheme.primaryColor),
          color: isSelected ? MyTheme.primaryColor : Colors.transparent),
      child: Text(
        source.name ?? '',
        style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : MyTheme.primaryColor),
      ),
    );
  }
}
