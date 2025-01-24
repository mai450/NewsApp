import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/views/category_screen.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
              builder: (BuildContext context) =>
                  CategoryScreen(category: category.title)),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 8, bottom: 10),
        height: 120,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(category.image), fit: BoxFit.cover)),
        child: Text(
          category.title,
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
