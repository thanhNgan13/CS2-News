// import 'package:cs2_news/models/post_model.dart';

// class PostService {
//   final CollectionReference posts =
//       FirebaseFirestore.instance.collection('posts');

//   Future<void> addPosts(List<Post> listPosts) async {
//     try {
//       for (var post in listPosts) {
//         await posts.add({
//           'title': post.title,
//           'link': post.link,
//           'pubDate': post.pubDate,
//           'contents': post.contents,
//           'imageUrl': post.imageUrl,
//           'category': post.category,
//           //Thêm các trường khác nếu cần
//         });
//       }
//       print('Data added to Firestore successfully');
//     } catch (e) {
//       print('Error adding data to Firestore: $e');
//     }
//   }

//   Future<List<Post>> getPosts() async {
//     try {
//       QuerySnapshot querySnapshot = await posts.get();
//       List<Post> postList = [];

//       querySnapshot.docs.forEach((doc) {
//         postList.add(Post(
//           title: doc['title'],
//           link: doc['link'],
//           pubDate: doc['pubDate'],
//           contents: List<String>.from(doc['contents']),
//           imageUrl: doc['imageUrl'],
//           category: doc['category'],
//           //Thêm các trường khác nếu cần
//         ));
//       });

//       return postList;
//     } catch (e) {
//       print('Error getting posts from Firestore: $e');
//       return [];
//     }
//   }
// }
