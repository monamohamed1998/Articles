import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp2/api_constants.dart';
import 'package:newsapp2/model/news_response/news/news_response/news_response.dart';
import 'package:newsapp2/model/source_response/source_response.dart';
import 'package:newsapp2/model/source_response/source.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=c319f610e68f4f4bb4e1ef371b44df61
class ApiManager {
  static Future<SourceResponse> getSources(CatId) async {
    Uri url = Uri.https(ApiConstants.baseURL, ApiConstants.sourceEndpoint,
        {'apiKey': ApiConstants.apiKey, 'category': CatId});

    try {
      final response = await http.get(url);
      //convert the response from string to json then to object
      final json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse> getNews(String sourceId, String page) async {
    var uri = Uri.https(
      ApiConstants.baseURL,
      ApiConstants.NewsEndPoint,
      {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
        'page': page,
        'pageSize': '10',
      },
    );
    print(uri);

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      print("Failed to fetch news. Status code: ${response.statusCode}");
      return Future.error("Failed to load news");
    }

    final json = jsonDecode(response.body);
    print("Response JSON: $json");
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> search(String query) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.NewsEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'q': query,
      'pageSize': '20',
    });

    try {
      final response = await http.get(uri);
      //convert the response from string to json then to object
      final json = jsonDecode(response.body);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
