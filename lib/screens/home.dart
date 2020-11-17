import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';

import 'news.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _currentIndex = 0;

  final views = [
    News(),
    Center(child: Text("Ammends")),
    Center(child: Text("You")),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.textColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
          child: Icon(Icons.public, size: 25.0),
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Our Situation, Today",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Palette.textColor,
        unselectedItemColor: Palette.textColor,
        currentIndex: _currentIndex,
        backgroundColor: Palette.lightHint,
        showUnselectedLabels: false,
        iconSize: 35,
        unselectedLabelStyle: TextStyle(fontFamily: "OSExtraBold", fontSize: 13.0),
        selectedLabelStyle: TextStyle(fontFamily: "OSExtraBold", fontSize: 15.0),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: "Repercussions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            label: "Ammends",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "You",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
