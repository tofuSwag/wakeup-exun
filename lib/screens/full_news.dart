import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wakeup/configs/dissapear_app_bar.dart';
import 'package:wakeup/configs/news_data.dart';
import 'package:wakeup/configs/palette.dart';

class BadNews extends StatelessWidget {
  final NewsData newsData;

  const BadNews({Key key, @required this.newsData})
      : assert(newsData != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsTitle = newsData.title;
    final newsDescription = newsData.description;
    final newsAuthor = newsData.author;
    final newsImageUrl = newsData.imageUrl;
    final newsUrl = newsData.url;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final titleTheme = Theme.of(context).textTheme.caption;
    final dataTheme = Theme.of(context).textTheme.headline3;
    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0.0,
              primary: true,
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.fromLTRB(0, 2.0, 0, 2.0),
                centerTitle: true,
                title: SABT(
                    child: Text(
                  "$newsTitle",
                  style: titleTheme,
                )),
                background: Column(
                  children: [
                    Image.network("$newsImageUrl", fit: BoxFit.cover),
                    Container(
                      color: Palette.scaffold,
                      height: 100,
                      width: screenWidth,
                      child: Text("$newsTitle"),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("$newsAuthor"),
              Text(
                "$newsDescription",
                style: dataTheme,
              ),
              Row(
                children: [
                  RaisedButton(
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    onPressed: () {},
                    color: Palette.hint,
                    textColor: Colors.white,
                    child: Text(
                      "Volunteer",
                      style: TextStyle(fontFamily: "OSBold"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
