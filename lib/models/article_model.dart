import 'package:e_news/models/source_model.dart';

class ArticleModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  Source? source;

  ArticleModel(
      {this.source,
      this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.title,
      this.url,
      this.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: Source.fromJson(json['source']),
      author: json['author'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );
  }
}
