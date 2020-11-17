import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';

import '../components/news.dart';

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
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    views[0] = News(
        newsAuthor: "Jivansh Sharma",
        newsTitle: "Poverty, on the rise",
        newsTag: "Poverty",
        screenHeight: screenHeight,
        screenWidth: screenWidth,
      );


    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.public, size: 25.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 0, 0, 0),
              child: Text(
                "Our Situation, Today",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ],
        ),
      ),
      body: views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Palette.textColor,
        unselectedItemColor: Palette.textColor,
        currentIndex: _currentIndex,
        backgroundColor: Palette.lightHint,
        showUnselectedLabels: false,
        iconSize: 35,
        selectedLabelStyle:
            TextStyle(fontFamily: "OSExtraBold", fontSize: 13.0),
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
