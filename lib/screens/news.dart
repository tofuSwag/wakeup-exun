import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  
  int _currentIndex = 0;

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
        currentIndex: _currentIndex,
        iconSize: 30,
        backgroundColor: Palette.hint,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            title: Text("Repercusions"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text("Repercusions"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Repercusions"),
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
