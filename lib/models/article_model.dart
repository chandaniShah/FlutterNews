class ArticleModel {
  // late String author;
  late String title;
  late String description;
  late String url;
  late String urlToImage;
  late String content;
  // late DateTime publisheAt;

  ArticleModel({
    // required this.author,
    required this.content,
    required this.description,
    required this.title,
    required this.url,
    required this.urlToImage,
    // required this.publisheAt
  });
}
