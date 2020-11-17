import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
      bottomNavigationBar: ,
    );
  }
}
