import 'package:flutter/material.dart';
import 'package:wakeup/configs/amend_data.dart';
import 'package:wakeup/configs/news_data.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/networking/networking_ammends.dart';
import 'package:wakeup/screens/get_ammends.dart';
import 'package:wakeup/screens/post_amend.dart';
import 'package:wakeup/networking/networking.dart';

import '../components/news.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<NewsData> onTap;

  const HomeScreen({Key key, this.onTap}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ValueChanged<NewsData> _onTap;
  final _newtworkingService = NetworkingService();

  Future<List<NewsData>> _getNews() async {
    final newsDataList = await _newtworkingService.getNewsDataFromApi();
    return newsDataList;
  }

  @override
  void initState() {
    super.initState();
    _onTap = widget.onTap;
  }

  int _currentIndex = 0;
  final views = [
    News(),
    Amends(),
    PostAmend(),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final listMan = FutureBuilder<List<NewsData>>(
        future: _getNews(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NewsData>> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Palette.accent),
              ),
            );
          } else {
            var newsFromApi = snapshot.data;
            newsFromApi.shuffle();
            return ListView.builder(
              itemCount: newsFromApi.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  splashColor: Palette.scaffold,
                  onTap: () {
                    _onTap(newsFromApi[index]);
                  },
                  child: News(
                    newsAuthor: newsFromApi[index].author,
                    newsTag: newsFromApi[index].tag,
                    newsTitle: newsFromApi[index].title,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                  ),
                );
              },
            );
          }
        });

    views[0] = listMan;
    views[1] = Amends(
      screenHeight: screenHeight / 1.5,
    );

    return Scaffold(
      backgroundColor: Palette.scaffold,
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(width: 30),
            Icon(Icons.public, size: 25.0),
          ],
        ),
        title: _currentIndex == 0
            ? Text(
                "Our Situation, Today",
                style: Theme.of(context).textTheme.headline2,
              )
            : Text(
                "How You Can Help",
                style: Theme.of(context).textTheme.headline2,
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
