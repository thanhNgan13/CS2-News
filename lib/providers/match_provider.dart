import 'package:cs2_news/models/match_section_model.dart';
import 'package:cs2_news/models/thread_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:html/parser.dart' as parser;

class MatchProvider with ChangeNotifier {
  late List<MatchSection> _matchSections = [];
  bool _isLoading = false;

  List<MatchSection> get matchSections => _matchSections;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    // print('fetchData');
    // _isLoading = true;
    // notifyListeners();
    // print('start fetching data');

    final responseRSS =
        await http.get(Uri.parse('https://www.hltv.org/matches'));
    if (responseRSS.statusCode == 200) {
      // final documentRSS = parser.parse(responseRSS.body);
      // final itemsRSS =
      //     documentRSS.getElementsByClassName('upcomingMatchesSection');
      // List<MatchSection> newsList = [];
      // for (var item in itemsRSS) {
      //   try {
      //     String time = item.getElementsByClassName('matchDayHeadline').first.text;
      //     print('time: $time');
      //     MatchSection newMatchSection = MatchSection(
      //       time: time,
      //       matchs: [],
      //     );

      //     newsList.add(newMatchSection);
      //   } catch (e) {
      //     print('Error fetching item: $e');
      //     // Bỏ qua và tiếp tục với item tiếp theo
      //   }
      // }

      // _matchSections = newsList;
      // print(_matchSections.length);
      // print('End fetching data');
      // _isLoading = false;
      // notifyListeners();
      print('Done');
    } else {
      throw Exception('Failed to load RSS');
    }
  }
}
