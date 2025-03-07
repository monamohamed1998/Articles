import 'package:flutter/material.dart';
import 'package:newsapp2/News/data/data_source/news_api_data_source.dart';
import 'package:newsapp2/News/data/models/article.dart';

import '../../shared/service_locator.dart';
import '../data/repository/news_repo.dart';

class NewsViewModel with ChangeNotifier {
  final repo = NewsRepo(ServiceLocator.newsdataSource);
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
      atricles = await repo.getNews(sourceID, page);
      // print("Response articles: ${news[2].description}"); // ✅ شوفي هل في بيانات
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
