import 'package:newsapp2/sources/data/models/source.dart';

import '../data_sources/sources_api_data_source.dart';
import '../data_sources/sources_data_source.dart';

class SourcesRepo {
  final SourcesDataSource datasource;
  SourcesRepo(this.datasource);

  Future<List<Source>> getSources(String CatId) async {
    return datasource.getSources(CatId);
  }
}
