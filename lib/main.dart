import 'package:cs2_news/providers/match_provider.dart';
import 'package:cs2_news/providers/post_provider.dart';
import 'package:cs2_news/providers/thread_provider.dart';
import 'package:cs2_news/views/pages/match.dart';
import 'package:cs2_news/views/pages/thread.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'models/BottomNavItem.dart';
import 'views/pages/home.dart';
import 'views/widgets/AppBar.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => PostProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThreadProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MatchProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Opera News',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late PostProvider _postProvider; // Thêm biến để lưu trữ PostProvider
  late ThreadProvider _threadProvider;
  late MatchProvider _matchProvider;

  @override
  void initState() {
    super.initState();
    // Lấy PostProvider từ MultiProvider
    _postProvider = context.read<PostProvider>();
    _threadProvider = context.read<ThreadProvider>();
    _matchProvider = context.read<MatchProvider>();
  }

  // Hàm thực hiện fetch data
  void _refreshDataPost() {
    _postProvider.fetchData();
  }

  // Hàm thực hiện fetch data
  void _refreshDataThread() {
    _threadProvider.fetchData();
  }

  // Hàm thực hiện fetch data
  void _refreshDataMatch() {
    _matchProvider.fetchData();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Nếu index là 0 (tab "Refresh"), gọi hàm refresh data
      if (index == 0) {
        _refreshDataPost();
      } else if (index == 1) {
        _refreshDataThread();
      } else {
        _refreshDataMatch();
      }
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    const ThreadPage(),
    const MatchPage(),
  ];

  final List<BottomNavItem> bottomNavItems = [
    BottomNavItem(
        icon: const Icon(
          Icons.refresh,
        ),
        label: 'Refresh'),
    BottomNavItem.fa(
        faIcon: const FaIcon(FontAwesomeIcons.three), label: 'Thread'),
    BottomNavItem(icon: const Icon(Icons.join_full), label: 'Match'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          for (var i = 0; i < bottomNavItems.length; i++)
            if (i == 0 && _selectedIndex != 0)
              const BottomNavigationBarItem(
                icon: Icon(Icons.newspaper_rounded),
                label: 'Home',
              )
            else
              BottomNavigationBarItem(
                icon:
                    bottomNavItems.elementAt(i).icon ?? const Icon(Icons.error),
                label: bottomNavItems.elementAt(i).label,
              )
        ],
      ),
    );
  }
}
