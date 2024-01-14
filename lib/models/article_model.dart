class ArticleModel {
  final String? imgUrl;
  final String title;
  final String? subTitle;
  final String? url;

  ArticleModel(
      {required this.imgUrl,
      required this.title,
      required this.subTitle,
      required this.url});

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      imgUrl: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
      url: json['url'],
    );
  }
}
