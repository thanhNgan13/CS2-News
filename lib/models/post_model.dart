class Post {
  String title;
  String link;
  String imageUrl;
  List<String> contents;
  String pubDate;
  String category;
  Post({
    required this.title,
    required this.link,
    required this.imageUrl,
    required this.contents,
    required this.pubDate,
    required this.category,
  });
}