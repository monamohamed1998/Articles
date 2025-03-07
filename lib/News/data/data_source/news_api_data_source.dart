import 'dart:convert';

import 'package:newsapp2/News/data/data_source/news_data_source.dart';
import 'package:newsapp2/News/data/models/article.dart';
import 'package:newsapp2/News/data/models/news_response.dart';
import 'package:newsapp2/shared/api_constants.dart';
import 'package:http/http.dart' as http;

class NewsApiDataSource extends NewsDataSource {
  @override
  Future<List<Article>> getNews(String SourceId, int page,
      {String language = 'en'}) async {
    Uri uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.NewsEndPoint,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': SourceId,
        'page': page.toString(),
        'pageSize': "10",
        'language': language,
      },
    );
    print("Fetching news from: $uri");
    print("Fetching news from source: $SourceId, page: $page");

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      print("Failed to fetch news. Status code: ${response.statusCode}");
      return Future.error("Failed to load news");
    }

    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == "ok" && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception("Failed to get Articles");
    }
  }
}
