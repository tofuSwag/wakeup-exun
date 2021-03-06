import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wakeup/configs/dissapear_app_bar.dart';
import 'package:wakeup/configs/news_data.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakeup/configs/toastie.dart';

class BadNews extends StatelessWidget {
  static final valueKey = ValueKey("BadNews");
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
    final volunteerLink = newsData.volunteerLink;
    final donateLink = newsData.donateLink;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    final titleTheme = Theme.of(context).textTheme.caption;
    final dataTheme = Theme.of(context).textTheme.headline3;

    void showToast(String msg, {int duration, int gravity}) {
      Toastie.show(msg, context, duration: duration, gravity: gravity);
    }

    return Scaffold(
      backgroundColor: Palette.scaffold,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0.0,
              primary: true,
              pinned: true,
              collapsedHeight: 80,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.only(top: 2, bottom: 2),
                title: SABT(
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: kToolbarHeight - 20, left: 20)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Expanded(
                          child: Text(
                            "$newsTitle",
                            style: titleTheme,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(
                        "$newsAuthor",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Palette.authorColor, fontFamily: "OSBold"),
                      ),
                    ],
                  ),
                ),
                background: Image.network("$newsImageUrl", fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "$newsAuthor",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Palette.authorColor,
                                fontFamily: "OSBold"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "$newsTitle",
                            style: titleTheme,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        "$newsDescription",
                        style: dataTheme,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0),
              ),
              FlatButton(
                onPressed: () async {
                  if (await canLaunch(newsUrl)) {
                    await launch(newsUrl);
                  }
                },
                child: Text(
                  "Read More",
                  style: TextStyle(
                      fontFamily: "OSBold",
                      color: Palette.authorColor,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  "To make a difference today:",
                  style: TextStyle(fontFamily: "OSBold", fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: screenWidth / 2.5,
                    height: 35.0,
                    child: RaisedButton(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onPressed: () async {
                        if (await canLaunch(donateLink)) {
                          await launch(donateLink);
                        } else {
                          showToast(
                            "Looks like one doesn't exist. Add one yourself on the You tab.",
                            gravity: Toastie.center,
                            duration: Toastie.lengthLong,
                          );
                        }
                      },
                      color: Palette.hint,
                      textColor: Colors.white,
                      child: Text(
                        "Fix It",
                        style: TextStyle(fontFamily: "OSBold", fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: screenWidth / 2.5,
                    height: 35.0,
                    child: RaisedButton(
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      onPressed: () async {
                        if (await canLaunch(volunteerLink)) {
                          await launch(volunteerLink);
                        } else {
                          showToast(
                            "Looks like one doesn't exist. Add one yourself on the You tab.",
                            gravity: Toastie.center,
                            duration: Toastie.lengthLong,
                          );
                        }
                      },
                      color: Palette.accent,
                      textColor: Colors.white,
                      child: Text(
                        "Help",
                        style: TextStyle(fontFamily: "OSBold", fontSize: 20),
                      ),
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
