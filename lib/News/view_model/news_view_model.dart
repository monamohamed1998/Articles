import 'package:flutter/material.dart';
import 'package:newsapp2/News/data/data_source/news_data_source.dart';
import 'package:newsapp2/News/data/models/article.dart';

class NewsViewModel with ChangeNotifier {
  final datasource = NewsDataSource();
  bool isLoading = false;
  String? errorMessage;
  List<Article> atricles = [];
  int page = 1;

  Future getNews(String sourceID) async {
    isLoading = true;
    notifyListeners();
    if (atricles.isNotEmpty) {
      atricles.clear();
      page = 1;
    }
    //get instance from the model
    try {
      final response = await datasource.getNews(sourceID, page);
      if (response.status == 'ok' && response.articles != null) {
        atricles.addAll(response.articles!);
        page++;
      } else {
        errorMessage = "Failed to load sources";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
