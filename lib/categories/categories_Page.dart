import 'package:flutter/material.dart';
import 'package:newsapp2/categories/category_detail.dart';
import 'package:newsapp2/categories/category_item.dart';
import 'package:newsapp2/categories/category_model.dart';

class CategoriesPage extends StatefulWidget {
  CategoriesPage({super.key, required this.OncategorySelect});

  final void Function(CategoryModel) OncategorySelect;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<CategoryModel> catModel = [
    CategoryModel(
        id: "sports", img: "assets/images/sport.jpg", title: 'Sports'),
    CategoryModel(
        id: "business", img: "assets/images/b.jpg", title: 'Buisness'),
    CategoryModel(id: "health", img: "assets/images/h.jpg", title: 'health'),
    CategoryModel(id: "science", img: "assets/images/sc.jpg", title: 'science'),
    CategoryModel(
        id: "technology", img: "assets/images/t.jpg", title: 'technology'),
  ];

  @override
  Widget build(BuildContext context) {
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
