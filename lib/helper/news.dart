import 'dart:convert';
import 'package:flutter_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = new List.from([], growable: true);

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=9142059cd9c644c7874d8667a82c6f93";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      // print(jsonData);
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              // author: element['author'],
              content: element['content'],
              description: element['description'],
              title: element['title'],
              url: element['url'],
              urlToImage: element['urlToImage']
              // publisheAt: element["publishedAt"]
              );
          news.add(articleModel);
          // print(news);
        }
      });
    }
  }
}

class CategoryNewsClass {
  List<ArticleModel> categoryNews = new List.from([], growable: true);

  Future<void> getCategoryNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=9142059cd9c644c7874d8667a82c6f93";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      // print(jsonData);
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
              // author: element['author'],
              content: element['content'],
              description: element['description'],
              title: element['title'],
              url: element['url'],
              urlToImage: element['urlToImage']
              // publisheAt: element["publishedAt"]
              );
          categoryNews.add(articleModel);
        }
      });
    }
  }
}
