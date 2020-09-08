import 'package:flutter/material.dart';
import 'package:instagram_clon_2/feed_page.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.healing), title: Text('')),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('')),
  ];
  int _selctedIndex = 0;
  static List<Widget> _screens = <Widget>[
    Feedpage(),
    Container(
      color: Colors.blueAccent,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.deepPurpleAccent,
    ),
    Container(
      color: Colors.cyanAccent,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selctedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: btmNavItems,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        currentIndex: _selctedIndex,
        onTap: _onBtmItemClick,
      ),
    );
  }

  void _onBtmItemClick(int index) {
    setState(() {
      _selctedIndex = index;
    });
  }
}
