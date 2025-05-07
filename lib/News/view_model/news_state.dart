import 'package:newsapp2/News/data/models/article.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

// class NewsLoadingMore extends NewsState {
//   final List<Article> oldArticles;
//   NewsLoadingMore(this.oldArticles);
// }

class NewsSuccess extends NewsState {
  final List<Article> articles;
  NewsSuccess(this.articles);
}

class NewsError extends NewsState {
  final String errorMessage;
  NewsError(this.errorMessage);
}
