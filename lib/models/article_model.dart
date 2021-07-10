import 'package:e_news/models/source_model.dart';

class ArticleModel {
  String? author, title, description, url, content;
  Source? source;
  String urlToImage;
  String? publishedAt;

  ArticleModel(
      {this.source,
      this.author,
      this.content,
      this.description,
      this.publishedAt,
      this.title,
      this.url,
      required this.urlToImage});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: Source.fromJson(json['source']),
      author:
          json['author'] != null ? json['author'] : "Author name not available",
      title: json['title'] != null ? json['title'] : "Title not available",
      description: json['description'] != null
          ? json['description']
          : "Description not available",
      url: json['url'] != null ? json['url'] : "Url not available",
      urlToImage: json['urlToImage'] != null
          ? json['urlToImage']
          : "https://fuerteventuraresidences.com/wp-content/themes/realestate-7/images/no-image.png",
      publishedAt: json['publishedAt'] != null
          ? json['publishedAt']
          : "Published time not available",
      content:
          json['content'] != null ? json['content'] : "Content not available",
    );
  }
}
