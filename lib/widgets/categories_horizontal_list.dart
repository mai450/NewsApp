import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widgets/category_container.dart';

class CategoriesHorizontalList extends StatelessWidget {
  const CategoriesHorizontalList({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.png', title: 'Business'),
    CategoryModel(image: 'assets/science.png', title: 'Science'),
    CategoryModel(image: 'assets/health.png', title: 'Health'),
    CategoryModel(image: 'assets/sports.png', title: 'Sports'),
    CategoryModel(image: 'assets/technology.jpeg', title: 'Technology'),
    CategoryModel(image: 'assets/entertainment.png', title: 'Entertainment'),
    CategoryModel(image: 'assets/general.png', title: 'General'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categories.length; i++)
            CategoryContainer(
              category: categories[i],
            ),
        ],
      ),
    );
  }
}
