import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/screens/full_news.dart';
import 'package:wakeup/screens/home.dart';
import 'configs/news_data.dart';
import 'networking/networking.dart';

void main() {
  runApp(WakeUpApp());
}

class WakeUpApp extends StatefulWidget {
  @override
  _WakeUpAppState createState() => _WakeUpAppState();
}

class _WakeUpAppState extends State<WakeUpApp> {
  NewsData _selectedNews;

  void onNewsTap(NewsData news) {
    this.setState(() {
      _selectedNews = news;
      print(news);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wake Up!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Palette.scaffold,
        accentColor: Palette.accent,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline3: TextStyle(
            color: Palette.textColor,
            fontFamily: "OSSemiBold",
            fontSize: 22.0,
          ),
          caption: TextStyle(
              color: Palette.textColor, fontFamily: "OSBold", fontSize: 26.0),
          headline1: TextStyle(
              color: Palette.textColor,
              fontFamily: "OSExtraBold",
              fontSize: 72.0),
          headline2: TextStyle(
              color: Palette.textColor, fontFamily: "OSBold", fontSize: 20.0),
          bodyText1: TextStyle(
              color: Palette.textColor,
              fontFamily: "OSSemiBold",
              fontSize: 15.0),
          bodyText2: TextStyle(
              color: Palette.textColor, fontFamily: "OSBold", fontSize: 15.0),
          subtitle1: TextStyle(
              color: Palette.textColor,
              fontFamily: "OSRegular",
              fontSize: 35.0),
        ),
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            child: HomeScreen(
              onTap: this.onNewsTap,
            ),
            key: ValueKey('home'),
          ),
          if (this._selectedNews != null)
            MaterialPage(
              child: BadNews(newsData: _selectedNews),
              key: ValueKey('newsOpen'),
            )
        ],
        onPopPage: (route, result) {
          return route.didPop(result);
        },
      ),
    );
  }
}
