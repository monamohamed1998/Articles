import 'dart:convert';

import 'package:newsapp2/News/data/models/news_response.dart';
import 'package:newsapp2/shared/api_constants.dart';
import 'package:http/http.dart' as http;

class NewsDataSource {
  Future<NewsResponse> getNews(String sourceId, int page,
      {String language = 'en'}) async {
    Uri uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.NewsEndPoint,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
        'page': page.toString(),
        'pageSize': "10",
        'language': language,
      },
    );
    // print("Fetching news from: $uri");
    // print("Fetching news from source: $sourceId, page: $page");

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      print("Failed to fetch news. Status code: ${response.statusCode}");
      return Future.error("Failed to load news");
    }

    final json = jsonDecode(response.body);
    // print("Response JSON: $json");
    return NewsResponse.fromJson(json);
  }
}
