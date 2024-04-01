import 'package:cs2_news/views/widgets/match_item.dart';
import 'package:flutter/material.dart';

import 'package:cs2_news/models/match_model.dart';

class MatchSectionWidget extends StatelessWidget {
  const MatchSectionWidget({
    super.key,
    required this.time,
    required this.matches,
  });

  final String time;
  final List<Match> matches;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 25,
      ),
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orange,
              width: 0.5,
            ),
          ),
          child: Text(
            time,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
            children: matches.map((item) => MatchItem(match: item)).toList()),
      ]),
    );
  }
}
