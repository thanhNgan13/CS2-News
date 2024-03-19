// import 'package:flutter/material.dart';
// import 'package:cs2_news/models/post_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;
// import 'package:cs2_news/services/post_service.dart';

// class PostProvider with ChangeNotifier {
//   late List<Post> _posts = [];
//   bool _isLoading = false;

//   List<Post> get posts => _posts;
//   bool get isLoading => _isLoading;
//   final PostService _postService = PostService();

//   Future<void> fetchData() async {
//     print('fetchData');
//     _isLoading = true;
//     notifyListeners();
//     print('start fetching data');

//     final response = await http.get(Uri.parse(
//         'https://news.google.com/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRGx6TVdZU0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen'));
//     final responseRSS = await http.get(Uri.parse(
//         'https://news.google.com/rss/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRGx6TVdZU0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US%3Aen'));
//     if (response.statusCode == 200 && responseRSS.statusCode == 200) {
//       final document = parser.parse(response.body);
//       final documentRSS = parser.parse(responseRSS.body);
//       final items = document.getElementsByClassName('IBr9hb');
//       final itemsRSS = documentRSS.getElementsByTagName('item');
//       List<Post> newsList = [];

//       for (int i = 0; i < items.length; i++) {
//         try {
//           print('start fetching items[i]');
//           String title = items[i].getElementsByClassName('gPFEn').first.text;
//           print('title: $title');
//           String link =
//               'https://news.google.com/rss${items[i].getElementsByClassName('gPFEn').first.attributes['href'].toString().split('.').last.split('?').first}';
//           //String pubDate = items[i].getElementsByTagName('pubDate').first.text;
//           //String source = items[i].getElementsByTagName('source').first.text;
//           print('link: $link');
//           String imageUrl =
//               'https://news.google.com${items[i].getElementsByClassName('Quavad').first.attributes['src'].toString().split('.').last}';
//           String pubDate =
//               itemsRSS[i].getElementsByTagName('pubDate').first.text;
//           print('pubDate: $pubDate');
//           // Lấy nội dung và hình ảnh từ link
//           var linkResponse = await http.get(Uri.parse(link));

//           if (linkResponse.statusCode == 200) {
//             var linkDocument = parser.parse(linkResponse.body);
//             link = linkDocument.getElementsByTagName('a').first.text;

//             var linkResponse2 = await http.get(Uri.parse(link));
//             if (linkResponse2.statusCode == 200) {
//               linkDocument = parser.parse(linkResponse2.body);
//               var article = linkDocument.getElementById('article-body');

//               if (article == null) {
//                 var articles =
//                     linkDocument.getElementsByClassName('article-content');
//                 if (articles.isEmpty) {
//                   articles = linkDocument
//                       .getElementsByClassName('article-content-container');
//                 }

//                 if (articles.isEmpty) {
//                   articles =
//                       linkDocument.getElementsByClassName('article__content');
//                 }

//                 if (articles.isEmpty) {
//                   articles = linkDocument.getElementsByTagName('article');
//                 }

//                 if (articles.isNotEmpty) {
//                   article = articles.first;
//                 }
//               }

//               article ??= linkDocument.getElementById('articlebody');
//               article ??= linkDocument.getElementById('article-body-contents');
//               article ??= linkDocument.getElementById('maincontent');

//               article ??= linkDocument.getElementsByTagName('body').first;

//               var paragraphs = article.getElementsByTagName('p');
//               List<String> contents = [];
//               int count = 0;
//               for (var paragraph in paragraphs) {
//                 contents.add(paragraph.text);
//                 count += paragraph.text.split(' ').length;
//                 if (count > 300) {
//                   break;
//                 }
//               }

//               if (contents.isEmpty ||
//                   imageUrl.isEmpty ||
//                   pubDate.isEmpty ||
//                   link.isEmpty ||
//                   title.isEmpty) {
//                 continue;
//               }

//               Post newspost = Post(
//                 title: title,
//                 link: link,
//                 pubDate: pubDate,
//                 contents: contents,
//                 imageUrl: imageUrl,
//                 category: 'General',
//               );
//               print('title: $title');
//               print('link: $link');
//               print('pubDate: $pubDate');
//               print('imageUrl: $imageUrl');
//               print('content: ');
//               for (var content in contents) {
//                 print(content);
//                 print('\n');
//               }
//               newsList.add(newspost);
//             }
//           }
//         } catch (e) {
//           print('Error fetching items[i]: $e');
//           // Bỏ qua và tiếp tục với items[i] tiếp theo
//         }
//       }

//       _posts = newsList;
//       _isLoading = false;
//       _postService.addPosts(_posts);
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load HTML');
//     }
//   }
// }
