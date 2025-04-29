import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:newsapp2/sources/data/data_sources/sources_api_data_source.dart';
import 'package:newsapp2/sources/data/models/source.dart';

import '../../shared/service_locator.dart';
import '../data/repository/sources_repo.dart';

class SourceViewModel with ChangeNotifier {
  final SourcesRepo repo;
  SourceViewModel() : repo = SourcesRepo(ServiceLocator.dataSource);
  List<Source> sources = [];
  //maybe there is error , maybe not
  String? errorMessage;
  bool isLoading = false;
  //void cause it saves the data on variable here
  Future<void> getSources(String CatId) async {
    isLoading = true;
    notifyListeners();

    try {
      sources = await repo.getSources(CatId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
