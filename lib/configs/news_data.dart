
class NewsData {
  NewsData(
      {this.title,
      this.description,
      this.author,
      this.tag,
      this.imageUrl,
      this.url,
      this.donateLink,
      this.volunteerLink});

  String title;
  String description;
  String author;
  String tag;
  String url;
  String imageUrl;
  String volunteerLink;
  String donateLink;

  NewsData.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        description = json['description'],
        author = json['author'],
        tag = json['category'],
        url = json['url'],
        volunteerLink = json['volunteerLink'],
        donateLink = json['donateLink'],
        imageUrl = json['urlToImage'];
        
}
