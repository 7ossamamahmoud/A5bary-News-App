import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        image: 'assets/business.avif',
        categoryName: 'Business',
      ),
      CategoryModel(
        image: 'assets/entertaiment.avif',
        categoryName: 'Entertainment',
      ),
      CategoryModel(
        image: 'assets/health.avif',
        categoryName: 'Health',
      ),
      CategoryModel(
        image: 'assets/science.avif',
        categoryName: 'Science',
      ),
      CategoryModel(
        image: 'assets/technology.jpeg',
        categoryName: 'Technology',
      ),
      CategoryModel(
        image: 'assets/sports.avif',
        categoryName: 'Sports',
      ),
      CategoryModel(
        image: 'assets/general.avif',
        categoryName: 'General',
      ),
    ];
    return SizedBox(
      height: 90,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => CategoryItem(
          categoryInfo: categories[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: categories.length,
      ),
    );
  }
}
