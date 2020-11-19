import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/networking/networking.dart';
import 'package:wakeup/screens/full_news.dart';

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

    final tagColor = {
      "Water Scarcity": Palette.water,
      "Pollution": Palette.pollution,
      "Biodiversity Loss": Palette.biodiversity,
      "Global Warming": Palette.global,
      "Deforestation": Palette.deforestation,
      "Food Waste": Palette.food,
      "Climate change": Palette.climate,
    };

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
      color: Palette.cardBackground,
      elevation: 0.0,
      child: Container(
        height: _screenHeight / 9,
        width: _screenWidth,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "$_newsTitle",
                    style: titleTheme,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    "Article By: $_newsAuthor",
                    style: authorTheme,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {},
                  color: tagColor[_newsTag],
                  textColor: Colors.white,
                  child: Text(
                    "$_newsTag",
                    style: TextStyle(fontFamily: "OSBold"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
