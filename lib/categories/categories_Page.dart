import 'package:flutter/material.dart';
import 'package:newsapp2/categories/category_item.dart';
import 'package:newsapp2/categories/category_model.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final List<CategoryModel> catModel = [
    CategoryModel(img: "assets/images/sport.jpg", title: 'Sports'),
    CategoryModel(img: "assets/images/b.jpg", title: 'Buisness'),
    CategoryModel(img: "assets/images/h.jpg", title: 'health'),
    CategoryModel(img: "assets/images/sc.jpg", title: 'science'),
    CategoryModel(img: "assets/images/t.jpg", title: 'technology'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: ListView.builder(
        itemBuilder: (context, index) => CategoryItem(
          categoryModel: catModel[index],
        ),
        itemCount: catModel.length,
      ),
    );
  }
}
