import 'package:flutter/material.dart';
import 'package:cs2_news/models/thread_model.dart';
import 'package:cs2_news/views/widgets/BodyThread.dart';

class ThreadItem extends StatelessWidget {
  const ThreadItem({
    super.key,
    required this.thread,
  });

  final Thread thread;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BodyThread(
                  link: thread.link,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thread.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: Colors.grey,
                      size: 10,
                    ),
                    const SizedBox(width: 3),
                    Flexible(
                      child: Text(
                        thread.activity,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.person_add_alt_outlined,
                      color: Colors.grey,
                      size: 10,
                    ),
                    const SizedBox(width: 3),
                    Flexible(
                      child: Text(
                        thread.author,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.message_outlined,
                      color: Colors.grey,
                      size: 10,
                    ),
                    const SizedBox(width: 3),
                    Flexible(
                      child: Text(
                        thread.replies.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          height: 4,
          color: const Color.fromARGB(255, 19, 23, 25),
        ),
      ],
    );
  }
}
