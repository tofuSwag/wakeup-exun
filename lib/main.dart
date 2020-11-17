import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';
import 'screens/home.dart';

void main() {
  runApp(WakeUpApp());
}

class WakeUpApp extends StatelessWidget {
  // This widget is the root of your application.
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
                  fontSize: 40.0),
              subtitle1: TextStyle(
                  color: Palette.textColor,
                  fontFamily: "OSRegular",
                  fontSize: 35.0))),
      home: HomeScreen(),
    );
  }
}
