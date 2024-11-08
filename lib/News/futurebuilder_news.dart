import 'package:flutter/material.dart';
import 'package:newsapp2/News/news_item.dart';
import 'package:newsapp2/model/news_response/news/news_response/article.dart';
import 'package:newsapp2/model/news_response/news/news_response/source.dart';

import '../api_manager.dart';

class FuturebuilderNews extends StatefulWidget {
  FuturebuilderNews({super.key, required this.sourceid});
  final String sourceid;

  @override
  State<FuturebuilderNews> createState() => _FuturebuilderNewsState();
}

class _FuturebuilderNewsState extends State<FuturebuilderNews> {
  int pageNum = 1;
  ScrollController? controller = ScrollController();
  List<Article> articles = [];
  bool lastPage = false;

  @override
  //do this once and onlyyy when the screen opened
  void initState() {
    controller!.addListener(() {
      //if the controller at the end edge
      if (controller!.position.atEdge && controller!.position.pixels != 0) {
        nextPage();
      }
    });
  }

//when perant rebuilt , set all vars to default
  @override
  void didUpdateWidget(covariant FuturebuilderNews oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    pageNum = 1;
    articles = [];
    lastPage = false;
  }

  @override
  Widget build(BuildContext context) {
    print("----->$pageNum");
    return FutureBuilder(
      future: ApiManager.getNews(widget.sourceid, pageNum.toString(),
          language: 'en'),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting &&
            articles.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return Text(" someting went wrong ");
        } else {
          if ((snapshot.data?.articles).isNotEmpty) {
            //to handle short page
            if (snapshot.data?.articles.length < 10) {
              lastPage = true;
              print("----------short");
            }
            articles.addAll(snapshot.data?.articles);
          } else {
            //to handle empty page
            lastPage = true;
            print("----------empty");
          }
          // articles = snapshot.data?.articles ?? [];
          return ListView.builder(
            controller: controller,
            itemBuilder: (_, index) => NewsItem(
              articles: articles[index],
            ),
            itemCount: articles.length,
          );
        }
      },
    );
  }

  void nextPage() {
    if (lastPage == false) {
      pageNum++;
      setState(() {});
    }
  }
}
