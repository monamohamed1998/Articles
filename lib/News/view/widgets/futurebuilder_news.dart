import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/News/view/widgets/news_item.dart';
import 'package:newsapp2/News/data/models/article.dart';
import 'package:newsapp2/News/data/models/source.dart';
import 'package:newsapp2/News/view_model/news_state.dart';
import 'package:newsapp2/News/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/data_source/news_api_data_source.dart';

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
  final newsViewModel = NewsViewModel();

  @override
  //do this once and onlyyy when the screen opened
  void initState() {
    newsViewModel.getNews(widget.sourceid);
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
    newsViewModel.getNews(widget.sourceid);
    controller!.addListener(() {
      //if the controller at the end edge
      if (controller!.position.atEdge && controller!.position.pixels != 0) {
        nextPage();
      }
    });
    print("----->$pageNum");
    return BlocProvider(
        create: (_) => newsViewModel,
        child: BlocBuilder<NewsViewModel, NewsState>(builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsError) {
            return Text(" someting went wrong view error");
          } else if (state is NewsSuccess) {
            if ((state.articles).isNotEmpty) {
              //to handle short page
              if ((state.articles).length < 10) {
                lastPage = true;
                print("----------short");
              }
              articles.addAll(state.articles);
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
          } else {
            return SizedBox();
          }
        }));

    // FutureBuilder(
    //   future: newsViewModel.getNews(widget.sourceid, pageNum, language: 'en'),
    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting &&
    //         articles.isEmpty) {
    //       return Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError || snapshot.data?.status != "ok") {
    //       return Text(" someting went wrong ");
    //     } else {
    //       if ((snapshot.data?.articles).isNotEmpty) {
    //         //to handle short page
    //         if (snapshot.data?.articles.length < 10) {
    //           lastPage = true;
    //           print("----------short");
    //         }
    //         articles.addAll(snapshot.data?.articles);
    //       } else {
    //         //to handle empty page
    //         lastPage = true;
    //         print("----------empty");
    //       }
    //       // articles = snapshot.data?.articles ?? [];
    //       return ListView.builder(
    //         controller: controller,
    //         itemBuilder: (_, index) => NewsItem(
    //           articles: articles[index],
    //         ),
    //         itemCount: articles.length,
    //       );
    //     }
    //   },
    // );
  }

  void nextPage() {
    if (lastPage == false) {
      pageNum++;
      setState(() {});
    }
  }
}
