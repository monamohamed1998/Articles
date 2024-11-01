import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:newsapp2/News/news_item.dart';
import 'package:newsapp2/TabBar/tab_item.dart';
import 'package:newsapp2/app_theme.dart';
import 'package:newsapp2/model/news_response/source.dart';

class CategoryDetail extends StatefulWidget {
  CategoryDetail({super.key, required this.sources});
  final List<Source> sources;

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  int selectedTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Tabbar should have tabController
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index) {
                setState(() {
                  selectedTapIndex = index;
                });
              },
              padding: EdgeInsets.only(bottom: 12, top: 9),
              indicatorWeight: 1,
              labelColor: AppTheme.nevy,
              dividerColor: Colors.transparent,
              indicatorColor: AppTheme.nevy,
              indicator: ShapeDecoration(
                color: AppTheme.Primary,
                shape: CircleBorder(),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(top: 23, bottom: 3),
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: widget.sources
                  .map((source) => TabItem(
                        sources: source.name ?? "",
                        isSelected:
                            widget.sources.indexOf(source) == selectedTapIndex,
                      ))
                  .toList()),
        ),
        SizedBox(
          height: 5,
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (_, index) => NewsItem(),
          itemCount: 10,
        ))
      ],
    );
  }
}
