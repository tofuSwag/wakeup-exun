import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';

class Amends extends StatefulWidget {
  @override
  _AmendsState createState() => _AmendsState();
}

class _AmendsState extends State<Amends> {
  TextStyle infoStyle =
      TextStyle(fontFamily: "OSBold", fontSize: 13, color: Palette.authorColor);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(
                "These are few ammends to make some wrongs right. While this wont fix all the damage we’ve done to mother earth, we need to remember ; Rome wasnt built in a day ",
                style: infoStyle),
          ],
        ),
      ),
    );
  }
}
