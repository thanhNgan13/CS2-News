import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cs2_news/providers/post_provider.dart';
import '../widgets/MyPost.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PostProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                provider.isLoading
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: provider.posts.map((item) {
                              return MyPost(post: item);
                            }).toList(),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
