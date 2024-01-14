// ignore_for_file: dead_code

import 'package:flutter/material.dart';

import '../models/article_model.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.articles});

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return NewsItem(
            article: articles[index],
          );
        },
        separatorBuilder: (context, index) => const Divider(
              height: 1.2,
              thickness: 1.8,
              endIndent: 10,
              indent: 10,
              color: Colors.orange,
            ));
  }
}
