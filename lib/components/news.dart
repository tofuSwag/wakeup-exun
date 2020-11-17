import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';

class News extends StatefulWidget {
  final String newsTitle;
  final String newsAuthor;
  final String newsTag;
  final screenWidth;
  final screenHeight;

  const News(
      {Key key,
      this.newsTitle,
      this.newsAuthor,
      this.newsTag,
      this.screenWidth,
      this.screenHeight})
      : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  String _newsTitle;
  String _newsAuthor;
  String _newsTag;
  var _screenWidth;
  var _screenHeight;

  @override
  void initState() {
    super.initState();
    _newsTitle = widget.newsTitle;
    _newsAuthor = widget.newsAuthor;
    _newsTag = widget.newsTag;
    _screenHeight = widget.screenHeight;
    _screenWidth = widget.screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    final titleTheme = Theme.of(context).textTheme.caption;
    final authorTheme = Theme.of(context).textTheme.bodyText1;
    return Card(
      margin: EdgeInsets.all(20),
      color: Palette.cardBackground,
      elevation: 1.0,
      child: Container(
        height: _screenHeight / 8,
        width: _screenWidth,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Text("$_newsTitle", style: titleTheme),
                ),
              ],
            ),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child:
                        Text("Article By : $_newsAuthor", style: authorTheme),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Water",
                        style: TextStyle(
                          fontFamily: "OSBold",
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    height: _screenHeight / 27,
                    width: _screenWidth / 14,
                    decoration: BoxDecoration(
                      color: Palette.accent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
