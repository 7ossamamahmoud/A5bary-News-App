import 'package:a5bary/views/category_view.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryInfo,
  });

  final CategoryModel categoryInfo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CategoryView(
                    categoryName: categoryInfo.categoryName,
                  ))),
      child: Container(
        height: 95,
        width: 150,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            image: DecorationImage(
              image: AssetImage(
                categoryInfo.image,
              ),
              fit: BoxFit.cover,
            )),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  5,
                ),
                child: Text(
                  categoryInfo.categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
