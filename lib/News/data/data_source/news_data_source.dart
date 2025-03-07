import '../models/article.dart';
import 'news_api_data_source.dart';

abstract class NewsDataSource {
  Future<List<Article>> getNews(String SourceId, int page);
}
