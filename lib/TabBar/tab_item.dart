import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';

class TabItem extends StatelessWidget {
  TabItem({super.key, required this.sources, required this.isSelected});

  final String sources;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 3,
      ),
      height: 30,
      child: Text(
        sources,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: isSelected ? AppTheme.Primary : AppTheme.nevy),
      ),
    );
  }
}
