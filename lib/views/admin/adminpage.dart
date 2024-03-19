// import 'package:flutter/material.dart';
// import 'package:cs2_news/providers/post_provider.dart';
// import 'package:cs2_news/views/admin/views/crawlpage.dart';
// import 'package:cs2_news/views/admin/views/dashboardpage.dart';
// import 'package:cs2_news/views/admin/views/postpage.dart';
// import 'package:cs2_news/models/BottomNavItem.dart';
// import 'package:provider/provider.dart';

// class AdminPage extends StatefulWidget {
//   const AdminPage({super.key});

//   @override
//   State<AdminPage> createState() => _AdminPageState();
// }

// class _AdminPageState extends State<AdminPage> {
//   int _selectedIndex = 0;
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   final List<Widget> _pages = [
//     const DashBoardPage(),
//     const CrawlPage(),
//     const PostPage()
//   ];

//   final List<BottomNavItem> bottomNavItems = [
//     BottomNavItem(
//         icon: const Icon(
//           Icons.dashboard,
//         ),
//         label: 'Dashboard'),
//     BottomNavItem(icon: const Icon(Icons.downloading_rounded), label: 'Crawl'),
//     BottomNavItem(icon: const Icon(Icons.newspaper_rounded), label: 'Post'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//             create: (context) => PostProvider()), // Cung cấp PostProvider ở đây
//       ],
//       child: Scaffold(
//           appBar: AppBar(
//             title: const Text('Admin Page'),
//           ),
//           body: IndexedStack(
//             index: _selectedIndex,
//             children: _pages,
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             backgroundColor: Colors.black,
//             unselectedItemColor: Colors.grey,
//             selectedItemColor: Colors.red,
//             unselectedFontSize: 15,
//             selectedFontSize: 15,
//             type: BottomNavigationBarType.fixed,
//             currentIndex: _selectedIndex,
//             onTap: _onItemTapped,
//             items: [
//               for (var i = 0; i < bottomNavItems.length; i++)
//                 BottomNavigationBarItem(
//                   icon: bottomNavItems.elementAt(i).icon,
//                   label: bottomNavItems.elementAt(i).label,
//                 )
//             ],
//           )),
//     );
//   }
// }
