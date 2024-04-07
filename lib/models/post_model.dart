class Post {
  int index;
  String title;
  String link;
  String imageUrl;
  List<String> contents;
  String pubDate;
  Post({
    required this.index,
    required this.title,
    required this.link,
    required this.imageUrl,
    required this.contents,
    required this.pubDate,
  });
}