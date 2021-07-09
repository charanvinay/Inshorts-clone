import 'dart:convert';

import 'package:e_news/models/article_model.dart';
import 'package:http/http.dart';

class News {
  final apiUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=f18f0e0eeee245d98a97fdb0a6378591";

  Future<List<ArticleModel>> getNews() async {
    Response response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];

      List<ArticleModel> articles =
          body.map((dynamic item) => ArticleModel.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
