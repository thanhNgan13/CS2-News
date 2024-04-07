import 'package:flutter/material.dart';
import 'package:cs2_news/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:html/parser.dart' as parser;

class PostProvider with ChangeNotifier {
  late List<Post> _posts = [];
  bool _isLoading = false;

  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    print('fetchData');
    _isLoading = true;
    notifyListeners();
    print('start fetching data');

    final responseRSS =
        await http.get(Uri.parse('https://www.hltv.org/rss/news'));
    if (responseRSS.statusCode == 200) {
      final documentRSS = xml.XmlDocument.parse(responseRSS.body);
      final itemsRSS = documentRSS.findAllElements('item');
      List<Post> newsList = [];
      int index = 0;
      for (var item in itemsRSS) {
        try {
          print('start fetching item');
          String title = item.findElements('title').first.innerText;
          print('title: $title');
          String link = item.findElements('link').first.innerText;
          String imageUrl =
              item.findElements('media:content').first.getAttribute('url')!;
          String pubDate = item.findElements('pubDate').first.innerText;
          print('link: $link');
          print('pubDate: $pubDate');
          List<String> contents = [];
          Post newspost = Post(
            index: index++,
            title: title,
            link: link,
            pubDate: pubDate,
            contents: contents,
            imageUrl: imageUrl,
          );

          newsList.add(newspost);
        } catch (e) {
          print('Error fetching item: $e');
          // Bỏ qua và tiếp tục với item tiếp theo
        }
      }

      _posts = newsList;
      print(_posts.length);
      print('End fetching data');
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load RSS');
    }
  }

  Future<void> fetchDataPost(int index, String link) async {
    print('fetchData');
    _isLoading = true;
    notifyListeners();
    print('start fetching data');

    final responseRSS = await http.get(Uri.parse(link));
    if (responseRSS.statusCode == 200) {
      List<String> newContents = [];
      final documentRSS = parser.parse(responseRSS.body);
      final itemsRSS = documentRSS.getElementsByClassName('news-block');
      int length = 0;
      for (var item in itemsRSS) {
        try {
          newContents.add(item.text);
          length += item.text.length;
          if (length > 300) break;
        } catch (e) {
          print('Error fetching item: $e');
          // Bỏ qua và tiếp tục với item tiếp theo
        }
      }

      print('End fetching data');
      _posts[index].contents = newContents;
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load RSS');
    }
  }
}
