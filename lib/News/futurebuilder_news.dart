import 'package:flutter/material.dart';
import 'package:newsapp2/News/news_item.dart';
import 'package:newsapp2/model/news_response/news/news_response/source.dart';

import '../api_manager.dart';

class FuturebuilderNews extends StatelessWidget {
  FuturebuilderNews({super.key, required this.sourceid});
  final String sourceid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getNews(sourceid),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return Text(" someting went wrong ");
        } else {
          final articles = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(
              articles: articles[index],
            ),
            itemCount: articles.length,
          );
        }
      },
    );
  }
}
