import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp2/api_constants.dart';
import 'package:newsapp2/model/news_response/source_response.dart';
import 'package:newsapp2/model/news_response/source.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=c319f610e68f4f4bb4e1ef371b44df61
class ApiManager {
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https(ApiConstants.baseURL, ApiConstants.sourceEndpoint,
        {'apiKey': ApiConstants.apiKey});
    print(url);

    try {
      final response = await http.get(url);
      //convert the response from string to json then to object
      final json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
