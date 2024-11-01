import 'package:flutter/material.dart';
import 'package:newsapp2/app_theme.dart';
import 'package:newsapp2/categories/categories_Page.dart';
import 'package:newsapp2/categories/category_detail.dart';
import 'package:newsapp2/categories/category_model.dart';
import 'package:newsapp2/categories/futurebuilder_sources.dart';
import 'package:newsapp2/drawer/home_drawer.dart';
import 'package:newsapp2/settings/settings_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static const String routeName = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        drawer: HomeDrawer(
          onItemSelected: onDrawerSelected,
        ),
        /*if i select specific category that means [SelectedCat != null] ,So
        open CategoryDetail but with specific ID
        */
        body: SelectedCat != null
            ? FuturebuilderSources(
                CategoryId: SelectedCat!.id,
              )
            : drawerSelectedIrem == DrawerItem.categories
                ? CategoriesPage(
                    OncategorySelect: onCategorySelected,
                  )
                : SettingsTab(),
      ),
    );
  }

  DrawerItem drawerSelectedIrem = DrawerItem.categories;

  void onDrawerSelected(DrawerItem draweritem) {
    setState(() {
      drawerSelectedIrem = draweritem;
      SelectedCat = null;
      Navigator.pop(context);
    });
  }

  CategoryModel? SelectedCat;
  void onCategorySelected(CategoryModel category) {
    SelectedCat = category;
    setState(() {});
  }
}
