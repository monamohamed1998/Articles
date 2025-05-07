import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/News/data/data_source/news_api_data_source.dart';
import 'package:newsapp2/News/data/models/article.dart';
import 'package:newsapp2/News/view_model/news_state.dart';

import '../../shared/service_locator.dart';
import '../data/repository/news_repo.dart';

class NewsViewModel extends Cubit<NewsState> {
  final NewsRepo newsrepo;
  int page = 1;

  NewsViewModel()
      : newsrepo = NewsRepo(ServiceLocator.newsdataSource),
        super(NewsInitial());

  Future<void> getNews(String sourceID) async {
    emit(NewsLoading()); // Show loading state first

    try {
      final articles = await newsrepo.getNews(sourceID, page);
      emit(NewsSuccess(articles));
    } catch (error) {
      emit(NewsError(error.toString()));
    }
  }
}

// class NewsViewModel with ChangeNotifier {
//   final NewsRepo newsrepo;
//   NewsViewModel() : newsrepo = NewsRepo(ServiceLocator.newsdataSource);
//   bool isLoading = false;
//   String? errorMessage;
//   List<Article> atricles = [];
//   int page = 1;

//   Future getNews(String sourceID) async {
//     isLoading = true;
//     notifyListeners();
//     if (atricles.isNotEmpty) {
//       atricles.clear();
//       page = 1;
//     }
//     //get instance from the model
//     try {
//       atricles = await newsrepo.getNews(sourceID, page);
//       // print("Response articles: ${news[2].description}"); // ✅ شوفي هل في بيانات
//     } catch (error) {
//       errorMessage = error.toString();
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }
