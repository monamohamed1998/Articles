import 'package:flutter/material.dart';
import 'package:newsapp2/shared/app_theme.dart';
import 'package:newsapp2/categories/view/widgets/categories_Page.dart';
import 'package:newsapp2/categories/view/widgets/category_detail.dart';
import 'package:newsapp2/categories/data/models/category_model.dart';
import 'package:newsapp2/sources/view/widgets/futurebuilder_sources.dart';
import 'package:newsapp2/home/view/widgets/home_drawer.dart';
import 'package:newsapp2/News/data/models/source.dart';
import 'package:newsapp2/settings/view/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../search/view/widgets/search_delegate.dart';

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
          title: Text(SelectedCat?.title ?? AppLocalizations.of(context)!.news),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // built in fun
                showSearch(
                  context: context,
                  delegate: SimpleSearchDelegate(),
                );
              },
            ),
          ],
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
                : SettingTab(),
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
