import 'package:flutter/material.dart';
import 'package:newsapp2/News/news_item_details.dart';
import 'package:newsapp2/app_theme.dart';
import 'package:newsapp2/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        NewsItemDetails.routeName: (context) => const NewsItemDetails(),
      },
      initialRoute: HomePage.routeName,
      theme: AppTheme.lightmode,
    );
  }
}
