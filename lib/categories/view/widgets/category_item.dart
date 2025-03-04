import 'package:flutter/material.dart';
import 'package:newsapp2/shared/app_theme.dart';
import 'package:newsapp2/categories/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.categoryModel, required this.index});

  CategoryModel categoryModel;
  final index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(categoryModel.img), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(134, 48, 48, 48),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                )),
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                categoryModel.title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
