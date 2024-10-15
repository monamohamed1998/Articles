import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';
import 'package:newsapp2/categories/categories_Page.dart';
import 'package:newsapp2/drawer/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const String routeName = "home_page";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          image: AssetImage(
            "assets/images/pattern.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        drawer: HomeDrawer(),
        body: CategoriesPage(),
      ),
    );
  }
}
