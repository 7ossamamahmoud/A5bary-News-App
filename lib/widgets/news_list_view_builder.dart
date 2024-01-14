import 'package:flutter/material.dart';

import '../services/api_service.dart';
import 'news_sliver_list.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.categoryName,
  });

  final String categoryName;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  late Future<dynamic> future;

  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(
      category: widget.categoryName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!);
            return NewsList(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  "Oops there is an error, please try later",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          } else {
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
