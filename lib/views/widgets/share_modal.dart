import 'package:flutter/material.dart';
import 'package:cs2_news/views/widgets/button_share.dart';
import 'package:cs2_news/views/widgets/out_line_button_custom.dart';

class ShareModal extends StatelessWidget {
  const ShareModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, // Đặt thuộc tính này thành true
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Share to',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ButtonShare(
                      path: 'assets/images/facebook-logo.png',
                      title: 'Facebook',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonShare(
                      path: 'assets/images/messenger-logo.jpg',
                      title: 'Messenger',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonShare(
                      path: 'assets/images/Whatsapp-logo.png',
                      title: 'Whatsapp',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ButtonShare(
                      path: 'assets/images/twitter-logo.png',
                      title: 'Twitter',
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    OutLineButtonCustom(
                      icon: const Icon(
                        Icons.more_horiz_sharp,
                        color: Colors.grey,
                      ),
                      title: 'More',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutLineButtonCustom(
                      icon: const Icon(
                        Icons.bookmark_border_rounded,
                        color: Colors.grey,
                      ),
                      title: 'Favorite',
                      onPressed: () {}),
                  const SizedBox(
                    width: 20,
                  ),
                  OutLineButtonCustom(
                    icon: const Icon(
                      Icons.copy,
                      color: Colors.grey,
                    ),
                    title: 'Copy link',
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Colors.grey,
                      width: 0.2,
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
