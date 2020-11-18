import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/screens/full_news.dart';
import 'configs/news_data.dart';

void main() {
  runApp(WakeUpApp());
}

class WakeUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataOfNews = NewsData(
      author: "Jivansh Sharma",
      description:
          '''A former Microsoft software engineer from Ukraine has been sentenced to nine years in prison for stealing more than 10 million in store credit from Microsoft's online store. From 2016 to 2018, Volo''',
      tag: "Poverty",
      title: "Poverty, on the rise",
      url: "https://jivansh.co",
      imageUrl:
          "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg",
    );
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
            fontFamily: "OSBold",
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
      home: BadNews(
        newsData: dataOfNews,
      ),
      // home: HomeScreen(),
    );
  }
}
