import 'package:newsapp2/News/data/data_source/news_api_data_source.dart';
import 'package:newsapp2/News/data/data_source/news_data_source.dart';
import 'package:newsapp2/News/data/models/article.dart';
import 'package:newsapp2/shared/service_locator.dart';

// the repo should use the abs method but the difinition for it will be sent at the constructor
class NewsRepo {
  final NewsDataSource datasource;
  NewsRepo(this.datasource);

  Future<List<Article>> getNews(String SourceId, int page) {
    return datasource.getNews(SourceId, page);
  }
}
