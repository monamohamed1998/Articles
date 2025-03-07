import 'package:newsapp2/News/data/data_source/news_api_data_source.dart';
import 'package:newsapp2/sources/data/data_sources/sources_api_data_source.dart';
import 'package:newsapp2/sources/data/data_sources/sources_data_source.dart';

import '../News/data/data_source/news_data_source.dart';

class ServiceLocator {
  static SourcesDataSource dataSource = SourcesApiDataSource();
  static NewsDataSource newsdataSource = NewsApiDataSource();
}
