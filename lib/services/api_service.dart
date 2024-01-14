import 'package:dio/dio.dart';

import '../models/article_model.dart';

class NewsService {
  final dio = Dio();
  String apiKey = 'a53a55c19afa4d3395a177f521daaf35';

  getNews({
    required String category,
  }) async {
    Response response = await dio.get(
      'https://newsapi.org/v2/top-headlines?category=$category&country=us&apiKey=$apiKey',
    );

    List<dynamic> articles = response.data['articles'];
    List<ArticleModel> articlesList = [];

    for (var article in articles) {
      ArticleModel articleModel = ArticleModel.fromJson(
        article,
      );
      articlesList.add(articleModel);
    }
    print(articlesList.length);
    return articlesList;
  }
}
