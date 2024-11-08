import 'package:flutter/material.dart';
import 'package:newsapp2/api_manager.dart';
import 'package:newsapp2/categories/category_detail.dart';

class FuturebuilderSources extends StatelessWidget {
  FuturebuilderSources({super.key, required this.CategoryId});
  final String CategoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(CategoryId, language: 'en'),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return Text(" someting went wrong ");
        } else {
          final sources = snapshot.data?.sources ?? "";
          return CategoryDetail(
            sources: sources,
          );
        }
      },
    );
  }
}
