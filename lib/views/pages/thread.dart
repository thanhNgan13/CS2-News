import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;

  const PostWidget({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Image.network(imageUrl),
          SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}

class ThreadPage extends StatefulWidget {
  const ThreadPage({super.key});

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thread'),
      ),
      body: ListView(
        children: [
          PostWidget(
            title: 'Post 1',
            imageUrl: 'https://via.placeholder.com/150',
            description: 'This is the first post',
          ),
          PostWidget(
            title: 'Post 2',
            imageUrl: 'https://via.placeholder.com/150',
            description: 'This is the second post',
          ),
          PostWidget(
            title: 'Post 3',
            imageUrl: 'https://via.placeholder.com/150',
            description: 'This is the third post',
          ),
        ],
      ),
    );
  }
}
