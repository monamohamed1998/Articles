import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:newsapp2/sources/data/models/source_response.dart';

import '../../../shared/api_constants.dart';

class SourcesDataSource {
  Future<SourceResponse> getSources(CatId, {String language = 'en'}) async {
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
}
