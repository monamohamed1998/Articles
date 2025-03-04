import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsapp2/sources/data/data_sources/sources_data_source.dart';
import 'package:newsapp2/sources/data/models/source.dart';

class SourceViewModel with ChangeNotifier {
  final datasource = SourcesDataSource();
  List<Source> sources = [];
  //maybe there is error , maybe not
  String? errorMessage;
  bool isLoading = false;
  //void cause it saves the data on variable here
  Future<void> getSources(String CatId) async {
    isLoading = true;
    notifyListeners();

    //get instance from the model
    try {
      final response = await datasource.getSources(CatId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errorMessage = "Failed to load sources";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
