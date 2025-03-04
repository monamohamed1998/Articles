import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:newsapp2/News/data/models/news_response.dart';

import '../../../shared/api_constants.dart';

class SearchDataSource {
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
