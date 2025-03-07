import 'package:newsapp2/sources/data/models/source.dart';

// the abs class to inharint from it
abstract class SourcesDataSource {
  Future<List<Source>> getSources(String CatId, {String language = "en"});
}
