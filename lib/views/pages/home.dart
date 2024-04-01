import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cs2_news/providers/post_provider.dart';
import '../widgets/MyPost.dart';
import '../widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                    ? const loading()
                    : Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: provider.posts.length,
                            itemBuilder: (context, index) {
                              var item = provider.posts[index];
                              return MyPost(
                                post: item,
                              );
                            },
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
