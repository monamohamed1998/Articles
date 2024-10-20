import 'package:flutter/material.dart';
import 'package:newsapp2/categories/category_detail.dart';
import 'package:newsapp2/categories/category_item.dart';
import 'package:newsapp2/categories/category_model.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key, required this.OncategorySelect});

  final void Function(CategoryModel) OncategorySelect;
  final List<CategoryModel> catModel = [
    CategoryModel(
        id: "sports", img: "assets/images/sport.jpg", title: 'Sports'),
    CategoryModel(id: "sports", img: "assets/images/b.jpg", title: 'Buisness'),
    CategoryModel(id: "sports", img: "assets/images/h.jpg", title: 'health'),
    CategoryModel(id: "sports", img: "assets/images/sc.jpg", title: 'science'),
    CategoryModel(
        id: "sports", img: "assets/images/t.jpg", title: 'technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final category = catModel[index];
          return GestureDetector(
            onTap: () => OncategorySelect(category),
            child: CategoryItem(
              categoryModel: catModel[index],
            ),
          );
        },
        itemCount: catModel.length,
      ),
    );
  }
}
