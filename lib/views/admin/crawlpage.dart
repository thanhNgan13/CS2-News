// // crawl_page.dart
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:cs2_news/providers/post_provider.dart';
// import 'package:cs2_news/models/post_model.dart';

// class CrawlPage extends StatefulWidget {
//   const CrawlPage({Key? key}) : super(key: key);

//   @override
//   State<CrawlPage> createState() => _CrawlPageState();
// }

// class _CrawlPageState extends State<CrawlPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PostProvider>(
//       builder: (context, provider, child) {
//         return Scaffold(
//           backgroundColor: Colors.black,
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     provider.fetchData();
//                   },
//                   child: Container(
//                     width: 100.0,
//                     height: 100.0,
//                     decoration: const BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Icon(Icons.download,
//                         size: 50.0, color: Colors.white),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 provider.isLoading
//                     ? const CircularProgressIndicator()
//                     : Expanded(
//                         child: SingleChildScrollView(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: provider.posts.map((item) {
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Title: ${item.title}',
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                   Text(
//                                     'Link: ${item.link}',
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                   Text(
//                                     'Content: ${item.contents}',
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                   Text(
//                                     'Image: ${item.imageUrl}',
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                   Text(
//                                     'PubDate: ${item.pubDate}',
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                   const Divider(
//                                     color: Colors.grey,
//                                     thickness: 1,
//                                   ),
//                                 ],
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                       ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
