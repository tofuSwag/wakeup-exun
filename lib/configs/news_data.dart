import 'package:wakeup/components/news.dart';

class NewsData {
  NewsData(
      {this.title,
      this.description,
      this.author,
      this.tag,
      this.imageUrl,
      this.url});

  String title;
  String description;
  String author;
  String tag;
  String url;
  String imageUrl;

  NewsData.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        author = json['author'],
        tag = "Poverty",
        url = json['url'],
        imageUrl = json['urlToImage'];
}
