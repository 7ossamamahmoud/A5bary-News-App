import 'package:a5bary/models/article_model.dart';
import 'package:flutter/material.dart';

import '../views/article_view.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              url: article.url,
            ),
          ),
        ),
        child: Column(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                article.imgUrl != null
                    ? "${article.imgUrl}"
                    : 'https://images.pexels.com/photos/518543/pexels-photo-518543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            article.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "${article.subTitle}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ]),
      ),
    );
  }
}
