import 'package:cs2_news/models/thread_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class ThreadProvider with ChangeNotifier {
  late List<Thread> _threads = [];
  bool _isLoading = false;

  List<Thread> get threads => _threads;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    print('fetchData');
    _isLoading = true;
    notifyListeners();
    print('start fetching data');

    final responseRSS =
        await http.get(Uri.parse('https://www.hltv.org/forums/counterstrike'));
    if (responseRSS.statusCode == 200) {
      final documentRSS = parser.parse(responseRSS.body);
      final itemsRSS = documentRSS.getElementsByClassName('tablerow ');
      List<Thread> newsList = [];
      int index = 0;
      for (var item in itemsRSS) {
        try {
          print('start fetching item');
          String title = item
              .getElementsByClassName('name')
              .first
              .getElementsByTagName('a')
              .first
              .text;
          print('title: $title');
          String link =
              'https://www.hltv.org/${item.getElementsByClassName('name').first.getElementsByTagName('a').first.attributes['href']}';
          print('link: $link');
          String author = item
              .getElementsByClassName('author')
              .first
              .getElementsByTagName('a')
              .first
              .text;
          print('author: $author');
          int replies =
              int.parse(item.getElementsByClassName('replies').first.text);
          print('replies: $replies');
          String activity = item
              .getElementsByClassName('activity')
              .first
              .getElementsByClassName('smartphone-only')
              .first
              .text;
          print('activity: $activity');
          Thread newThread = Thread(
            index: index++,
            title: title,
            link: link,
            author: author,
            replies: replies,
            activity: activity,
          );

          newsList.add(newThread);
        } catch (e) {
          print('Error fetching item: $e');
          // Bỏ qua và tiếp tục với item tiếp theo
        }
      }

      _threads = newsList;
      print(_threads.length);
      print('End fetching data');
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load RSS');
    }
  }
}
