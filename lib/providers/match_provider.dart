import 'package:cs2_news/models/match_section_model.dart';
import 'package:cs2_news/models/match_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class MatchProvider with ChangeNotifier {
  late List<MatchSection> _matchSections = [];
  bool _isLoading = false;

  List<MatchSection> get matchSections => _matchSections;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    print('fetchData');
    _isLoading = true;
    notifyListeners();
    print('start fetching data');

    var responseRSS = await http.get(Uri.parse('https://www.hltv.org/matches'));
    while (responseRSS.statusCode == 403) {
      responseRSS = await http.get(Uri.parse('https://www.hltv.org/matches'));
    }
    if (responseRSS.statusCode == 200) {
      final documentRSS = parser.parse(responseRSS.body);
      final itemsRSS =
          documentRSS.getElementsByClassName('upcomingMatchesSection');
      List<MatchSection> newsList = [];
      for (var item in itemsRSS) {
        try {
          String time =
              item.getElementsByClassName('matchDayHeadline').first.text;
          print('time: $time');

          final listMatches = item.getElementsByClassName('upcomingMatch');
          List<Match> matches = [];
          int index = 0;
          for (var match in listMatches) {
            String link =
                'https://www.hltv.org/${match.getElementsByTagName('a').first.attributes['href'].toString()}';
            String time = match.getElementsByClassName('matchTime').first.text;
            String meta = match.getElementsByClassName('matchMeta').first.text;
            final empty = match.getElementsByClassName('matchInfoEmpty');
            List<String> logoTeams = [];
            List<String> nameTeams = [];
            String logoEvent = '';
            if (empty.isEmpty) {
              logoTeams = [
                match
                    .getElementsByClassName('team1')
                    .first
                    .getElementsByTagName('img')
                    .first
                    .attributes['src']
                    .toString(),
                match
                    .getElementsByClassName('team2')
                    .first
                    .getElementsByTagName('img')
                    .first
                    .attributes['src']
                    .toString(),
              ];

              for (var i = 0; i < logoTeams.length; i++) {
                if (logoTeams[i].contains('/img/static/team/placeholder.svg')) {
                  logoTeams[i] = 'assets/images/placeholder.png';
                }
              }

              nameTeams = [
                match
                    .getElementsByClassName('team1')
                    .first
                    .getElementsByClassName('matchTeamName')
                    .first
                    .text,
                match
                    .getElementsByClassName('team2')
                    .first
                    .getElementsByClassName('matchTeamName')
                    .first
                    .text,
              ];
              logoEvent = match
                  .getElementsByClassName('matchEventLogoContainer')
                  .first
                  .getElementsByTagName('img')
                  .first
                  .attributes['src']
                  .toString();
            } else {
              print('empty: $empty.first.text');
            }

            Match newMatch = Match(
              index: index++,
              link: link,
              time: time,
              meta: meta,
              logoTeams: logoTeams,
              nameTeams: nameTeams,
              logoEvent: logoEvent,
              content: empty.isEmpty ? '' : empty.first.text,
            );
            print('link: ${newMatch.link}');
            print('time: ${newMatch.time}');
            print('meta: ${newMatch.meta}');
            print('logoTeams: ${newMatch.logoTeams}');
            print('nameTeams: ${newMatch.nameTeams}');
            print('logoEvent: ${newMatch.logoEvent}');

            matches.add(newMatch);
          }

          MatchSection newMatchSection = MatchSection(
            time: time,
            matches: matches,
          );

          newsList.add(newMatchSection);
        } catch (e) {
          print('Error fetching item: $e');
          // Bỏ qua và tiếp tục với item tiếp theo
        }
      }

      _matchSections = newsList;
      print(_matchSections.length);
      print('End fetching data');
      _isLoading = false;
      notifyListeners();
    } else {
      print('Error');
    }
  }
}
