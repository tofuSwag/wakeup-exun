import 'package:flutter/material.dart';
import 'package:wakeup/configs/news_data.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/networking/networking.dart';
import 'package:wakeup/screens/full_news.dart';

import '../components/news.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<NewsData> onTap;

  const HomeScreen({Key key, this.onTap}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsData> _newsDataList;
  ValueChanged<NewsData> _onTap;
  final _newtworkingService = NetworkingService();

  Future<List<NewsData>> _getNews() async {
    final newsDataList = await _newtworkingService.getNewsDataFromApi();
    this._newsDataList = newsDataList;
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
    Center(child: Text("Ammends")),
    Center(child: Text("You")),
  ];

  final dataOfNews = NewsData(
    author: "Jivansh Sharma",
    description: "Blah Blah",
    tag: "Poverty",
    title: "Poverty, on the rise",
    url: "https://jivansh.co",
    imageUrl: "https://jivansh.co",
  );

  @override
  Widget build(BuildContext context) {
    final newsList = [
      dataOfNews,
      dataOfNews,
      dataOfNews,
      dataOfNews,
      dataOfNews,
      dataOfNews,
      dataOfNews,
      dataOfNews,
      dataOfNews,
      dataOfNews,
    ];
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // final listBoy = ListView.builder(
    //   itemCount: _newsDataList.length,
    //   itemBuilder: (context, index) {
    //     return InkWell(
    //       onTap: () {
    //         _onTap(_newsDataList[index]);
    //       },
    //       child: News(
    //         newsAuthor: _newsDataList[index].author,
    //         newsTag: _newsDataList[index].tag,
    //         newsTitle: _newsDataList[index].title,
    //         screenHeight: screenHeight,
    //         screenWidth: screenWidth,
    //       ),
    //     );
    //   },
    // );

    final listMan = FutureBuilder<List<NewsData>>(
        future: _getNews(),
        builder:
            (BuildContext context, AsyncSnapshot<List<NewsData>> snapshot) {
          if (snapshot.data == null) {
            return Center(child: Text("wait"));
          } else {
            var newsFromApi = snapshot.data;
            return ListView.builder(
              itemCount: newsFromApi.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
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
        title: Text(
          "Our Situation, Today",
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
