import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp2/sources/data/data_sources/sources_data_source.dart';
import 'package:newsapp2/sources/data/models/source.dart';

import 'package:newsapp2/sources/data/models/source_response.dart';

import '../../../shared/api_constants.dart';

class SourcesApiDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(CatId, {String language = 'en'}) async {
    Uri url = Uri.https(ApiConstants.baseURL, ApiConstants.sourceEndpoint,
        {'apiKey': ApiConstants.apiKey, 'category': CatId});

    final response = await http.get(url);
    //convert the response from string to json then to object
    final json = jsonDecode(response.body);
    final sourcesresponse = SourceResponse.fromJson(json);
    if (sourcesresponse.status == "ok" && sourcesresponse.sources != null) {
      return sourcesresponse.sources!;
    } else {
      throw Exception("Failed to get sources");
    }
    // return SourceResponse.fromJson(json).sources ?? [];
  }
}
