import 'package:flutter/material.dart';
import 'package:cs2_news/models/post_model.dart';

import 'comment.dart';
import 'mini_size_post.dart';
import 'share_modal.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BodyPost extends StatefulWidget {
  const BodyPost({super.key, required this.post});

  final Post post;

  @override
  State<BodyPost> createState() => _BodyPostState();
}

class _BodyPostState extends State<BodyPost> {
  bool isWebView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.grey,
          size: 25,
        ),
        actions: [
          const Icon(
            Icons.menu_book_rounded,
          ),
          const SizedBox(
            width: 25,
          ),
          const Icon(
            Icons.text_fields_rounded,
          ),
          PopupMenuButton(
            color: Colors.black,
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                const PopupMenuItem(
                  value: 'Favorite',
                  child: Row(
                    children: [
                      Icon(
                        Icons.bookmark_border_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Favorite', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const PopupMenuItem(
                    value: 'Share',
                    child: Row(
                      children: [
                        Icon(
                          Icons.share_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text('Share', style: TextStyle(color: Colors.white)),
                      ],
                    )),
              ];
            },
            onSelected: (value) {
              if (value == 'Favorite') {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.bookmark_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'See my favorites',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                );
              } else if (value == 'Share') {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) => const ShareModal(),
                );
              }
            },
            icon: const Icon(Icons.more_vert),
            offset: const Offset(0, 70),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.post.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey[900],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.post.contents.join('\n\n'),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            isWebView = !isWebView;
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey[900]!),
                          ),
                          child: const Text(
                            'Read more',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.thumb_down_alt_outlined,
                        color: Colors.white,
                      )),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Container(
              height: 5,
              color: const Color.fromARGB(255, 19, 23, 25),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Maybe you like',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  MiniSizePost(post: widget.post),
                  MiniSizePost(post: widget.post),
                  MiniSizePost(post: widget.post)
                ],
              ),
            ),
            Container(
              height: 5,
              color: const Color.fromARGB(255, 19, 23, 25),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comments()',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Comment()
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => const ShareModal(),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.share),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) => Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.black,
                      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0,
                          MediaQuery.of(context).viewInsets.bottom + 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Comment...',
                              hintStyle: const TextStyle(color: Colors.white),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: const TextStyle(color: Colors.grey),
                            maxLines: 7,
                            minLines: 1,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(140, 35)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blueGrey.withOpacity(0.1)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.edit_note_rounded,
                      color: Colors.blueGrey[400],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Comment',
                      style: TextStyle(color: Colors.blueGrey[400]),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(bottom: 0),
              icon: Transform.scale(
                scaleX: -1,
                child: const Icon(
                  Icons.mode_comment_outlined,
                  color: Colors.white,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(bottom: 0),
              icon: const Icon(
                Icons.thumb_up_off_alt_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(bottom: 0),
              icon: const Icon(
                Icons.thumb_down_alt_outlined,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 60,
            ),
          ],
        ),
      ),
    );
  }
}
