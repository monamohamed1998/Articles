import 'package:flutter/material.dart';
import 'package:newsapp2/shared/api_constants.dart';
import 'package:newsapp2/sources/data/data_sources/sources_data_source.dart';
import 'package:newsapp2/categories/view/widgets/category_detail.dart';
import 'package:newsapp2/sources/view_model/source_view_model.dart';
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
    return ChangeNotifierProvider(
        create: (_) => viewModel,
        //consumer is same as provider but it gives ability to be a listner and using futurebuilder
        child: Consumer<SourceViewModel>(builder: (_, viewModel, __) {
          if (viewModel.isLoading)
            return Center(child: const CircularProgressIndicator());
          else if (viewModel.errorMessage != null)
            return Text(" someting went wrong ");
          else {
            return CategoryDetail(
              sources: viewModel.sources,
            );
          }
        }));
  }
}
