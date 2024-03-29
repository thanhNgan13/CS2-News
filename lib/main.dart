import 'package:cs2_news/views/pages/match.dart';
import 'package:cs2_news/views/pages/thread.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'models/BottomNavItem.dart';
import 'views/pages/home.dart';
import 'views/pages/user.dart';
import 'views/widgets/AppBar.dart';

void main() {
  runApp(const MyApp());
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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomePage(),
    const MatchPage(),
    const ThreadPage()
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
        appBar: (_selectedIndex == 0) ? const CustomAppBar() : null,
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
                  icon: bottomNavItems.elementAt(i).icon ??
                      const Icon(Icons.error),
                  label: bottomNavItems.elementAt(i).label,
                )
          ],
        ));
  }
}
