import 'package:flutter/material.dart';
import './feed.dart';
import './search.dart';
import './me.dart';

class MainNavigationTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabState();
  }
}

class _TabState extends State<MainNavigationTabs> {
  int _currentIndex = 0;
  final List<Widget> _children = [FeedScreen(), SearchScreen(), MeScreen()];

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(53, 98, 255, 1.0),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: onTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('FEED')),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail), title: Text('SEARCH')),
            BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('ME'))
          ]),
    );
  }
}
