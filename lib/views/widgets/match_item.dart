import 'package:cs2_news/providers/interstitialAd_provider.dart';
import 'package:cs2_news/views/widgets/BodyThread.dart';
import 'package:flutter/material.dart';
import 'package:cs2_news/models/match_model.dart';
import 'package:provider/provider.dart';

import 'load_image_network.dart';

class MatchItem extends StatelessWidget {
  const MatchItem({
    super.key,
    required this.match,
  });

  final Match match;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _precacheImages(context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Hiển thị tiến trình tải ảnh nếu cần
          return const CircularProgressIndicator();
        } else {
          // Hiển thị nội dung sau khi tải xong
          return _buildMatchItem(context);
        }
      },
    );
  }

  Widget _buildMatchItem(BuildContext context) {
    return InkWell(
      onTap: () {
        // Xử lý khi người dùng nhấn vào một trận đấu
        // Ví dụ: mở một trang chi tiết trận đấu
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BodyThread(
                    link: match.link,
                  )),
        );

        Provider.of<InterstitialAdProvider>(context, listen: false)
                .checkMoveTab();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          color: match.index % 2 == 0 ? Colors.grey[900] : Colors.grey[800],
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  match.time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 2,
                  ),
                  child: Text(
                    match.meta,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            match.content.isEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          _buildTeamRow(match, 0),
                          _buildTeamRow(match, 1),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 10,
                      ),
                      child: Center(
                        child: Text(
                          match.content,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
            if (match.content.isEmpty)
              loadImageNetwork(url: match.logoEvent, width: 30, height: 30),
          ],
        ),
      ),
    );
  }

  Future<void> _precacheImages(BuildContext context) async {
    for (final teamLogoUrl in match.logoTeams) {
      await precacheImage(NetworkImage(teamLogoUrl), context);
    }
    if (match.logoEvent.isNotEmpty) {
      await precacheImage(NetworkImage(match.logoEvent), context);
    }
  }

  Widget _buildTeamRow(Match match, int teamIndex) {
    return Row(
      children: [
        loadImageNetwork(
            url: match.logoTeams[teamIndex], width: 20, height: 20),
        const SizedBox(width: 5),
        Text(
          match.nameTeams[teamIndex],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
