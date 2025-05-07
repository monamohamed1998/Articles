import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp2/shared/api_constants.dart';
import 'package:newsapp2/sources/data/data_sources/sources_api_data_source.dart';
import 'package:newsapp2/categories/view/widgets/category_detail.dart';
import 'package:newsapp2/sources/view_model/source_view_model.dart';
import 'package:newsapp2/sources/view_model/sources_state.dart';
import 'package:provider/provider.dart';

class FuturebuilderSources extends StatefulWidget {
  FuturebuilderSources({super.key, required this.CategoryId});
  final String CategoryId;

  @override
  State<FuturebuilderSources> createState() => _FuturebuilderSourcesState();
}

class _FuturebuilderSourcesState extends State<FuturebuilderSources> {
  // final datasource = SourcesDataSource();
  //this is obj from provider cause the provider is defined at the view model
  final viewModel = SourceViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(
      widget.CategoryId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => viewModel,
        child: BlocBuilder<SourceViewModel, SourcesState>(
            builder: (context, State) {
          if (State is SourceLoading)
            return Center(child: const CircularProgressIndicator());
          else if (State is SourceError)
            return Text(" someting went wrong ");
          else if (State is SourceSucsses) {
            return CategoryDetail(
              sources: State.sources,
            );
          } else
            return SizedBox();
        }));
  }
}
