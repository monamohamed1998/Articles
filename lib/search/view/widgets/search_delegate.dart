import 'package:flutter/material.dart';
import 'package:newsapp2/shared/app_theme.dart';
import 'package:newsapp2/News/data/models/source.dart';
import 'package:newsapp2/search/view/widgets/suggestion_title.dart';

import '../../../News/view/widgets/news_item.dart';
import '../../../News/data/models/article.dart';
import '../../data/data_source/search_data_source.dart';

class SimpleSearchDelegate extends SearchDelegate {
  //search button
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {
          //built in function
          showResults(context);
        },
      ),
    ];
  }

  // Back button on the search bar
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  // Show results based on the search query
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: SearchDataSource.search(query),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return Text(" someting went wrong ");
        } else {
          final articles = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(
              articles: articles[index],
            ),
            itemCount: articles.length,
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text("Type to search for news..."));
    }

    return FutureBuilder(
      future: SearchDataSource.search(
          query), // Same API function as in buildResults
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.status != "ok") {
          return Text("Something went wrong");
        } else {
          final List<Article> articles = snapshot.data?.articles ?? [];

          // Filter suggestions to get the article's title that equals to the query i wrote
          final suggestions = articles.where((article) {
            return article.title!.toLowerCase().contains(query.toLowerCase());
          }).toList();
          //the return for else
          return ListView.builder(
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final article = suggestions[index];
              return ListTile(
                title: SuggestionTitle(text: article.title!),
                onTap: () {
                  query =
                      article.title!; // Set the query to selected suggestion
                  showResults(
                      context); // Show results based on selected suggestion
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        scaffoldBackgroundColor: AppTheme.white,
        inputDecorationTheme: InputDecorationTheme(border: InputBorder.none));
  }
}
