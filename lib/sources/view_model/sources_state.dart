import 'package:newsapp2/sources/data/models/source.dart';

abstract class SourcesState {}

class SourceInitial extends SourcesState {}

class SourceLoading extends SourcesState {}

class SourceSucsses extends SourcesState {
  List<Source> sources = [];
  SourceSucsses(this.sources);
}

class SourceError extends SourcesState {
  final String message;
  SourceError(this.message);
}
