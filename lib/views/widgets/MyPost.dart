import 'package:cs2_news/providers/post_provider.dart';
import 'package:cs2_news/views/widgets/load_image_network.dart';
import 'package:flutter/material.dart';
import 'package:cs2_news/models/post_model.dart';
import 'package:cs2_news/views/widgets/BodyPost.dart';
import 'package:provider/provider.dart';

class MyPost extends StatelessWidget {
  const MyPost({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(builder: (context, provider, child) {
      return Container(
        margin: const EdgeInsets.only(bottom: 15.0),
        child: InkWell(
          onTap: () {
            if (post.contents.isEmpty) {
              provider.fetchDataPost(post.index, post.link);
            }
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BodyPost(
                        post: post,
                      )),
            );
          },
          child: Column(
            children: [
              Image.network(
                post.imageUrl,
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Image(
                    image: AssetImage('assets/images/error.jpg'),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const ClipOval(
                          child: loadImageNetwork(
                              url:
                                  'https://www.hltv.org/img/static/TopSmallLogo2x.png',
                              width: 20,
                              height: 20),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'HLTV',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          post.pubDate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      post.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
