import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/screens/full_news.dart';
import 'package:wakeup/screens/home.dart';
import 'configs/news_data.dart';

void main() {
  runApp(WakeUpApp());
}

class WakeUpApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dataOfNews = NewsData(
      author: "Jivansh Sharma",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
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
                  fontSize: 20.0),
              caption: TextStyle(
                  color: Palette.textColor,
                  fontFamily: "OSBold",
                  fontSize: 26.0),
              headline1: TextStyle(
                  color: Palette.textColor,
                  fontFamily: "OSExtraBold",
                  fontSize: 72.0),
              headline2: TextStyle(
                  color: Palette.textColor,
                  fontFamily: "OSBold",
                  fontSize: 20.0),
              bodyText1: TextStyle(
                  color: Palette.textColor,
                  fontFamily: "OSSemiBold",
                  fontSize: 15.0),
              bodyText2: TextStyle(
                  color: Palette.textColor,
                  fontFamily: "OSBold",
                  fontSize: 15.0),
              subtitle1: TextStyle(
                  color: Palette.textColor,
                  fontFamily: "OSRegular",
                  fontSize: 35.0))),
      home: BadNews(
        newsData: dataOfNews,
      ),
      // home: HomeScreen(),
    );
  }
}
