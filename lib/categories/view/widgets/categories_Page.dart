import 'package:flutter/material.dart';
import 'package:newsapp2/categories/view/widgets/category_detail.dart';
import 'package:newsapp2/categories/view/widgets/category_item.dart';
import 'package:newsapp2/categories/data/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({super.key, required this.OncategorySelect});

  final void Function(CategoryModel) OncategorySelect;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    final List<CategoryModel> catModel = [
      CategoryModel(
          id: "sports",
          img: "assets/images/sport.jpg",
          title: AppLocalizations.of(context)!.sports),
      CategoryModel(
          id: "business",
          img: "assets/images/b.jpg",
          title: AppLocalizations.of(context)!.buisness),
      CategoryModel(
          id: "health",
          img: "assets/images/h.jpg",
          title: AppLocalizations.of(context)!.health),
      CategoryModel(
          id: "science",
          img: "assets/images/sc.jpg",
          title: AppLocalizations.of(context)!.science),
      CategoryModel(
          id: "technology",
          img: "assets/images/t.jpg",
          title: AppLocalizations.of(context)!.technology),
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final category = catModel[index];
          return GestureDetector(
            onTap: () => widget.OncategorySelect(category),
            child: CategoryItem(
              categoryModel: catModel[index],
              index: index,
            ),
          );
        },
        itemCount: catModel.length,
      ),
    );
  }
}
