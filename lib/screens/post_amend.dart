import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/configs/toastie.dart';
import 'package:http/http.dart' as http;

class PostAmend extends StatefulWidget {
  @override
  _PostAmendState createState() => _PostAmendState();
}

class _PostAmendState extends State<PostAmend> {
  var _location;
  String info =
      "Tell us more about any organization or volunteer \ngroup that our team can add to the Ammends tab. ";
  TextStyle infoStyle =
      TextStyle(fontFamily: "OSBold", fontSize: 13, color: Palette.authorColor);

  TextEditingController _orgName = TextEditingController();
  TextEditingController _orgUrl = TextEditingController();
  TextEditingController _orgAmount = TextEditingController();
  TextEditingController _orgMission = TextEditingController();
  TextEditingController _orgDescription = TextEditingController();

  void _getDeviceLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _location = position;
    });
  }

  void postAndClear(name, url, amount, mission, description, location) async {
    String orgName = name.text;
    String orgUrl = url.text;
    String orgAmount = amount.text;
    String orgMission = mission.text;
    String orgDescription = description.text;

    if (orgName == "" ||
        orgUrl == "" ||
        orgAmount == "" ||
        orgMission == "" ||
        orgDescription == "") {
      showToast(
        "A field was left empty. Try again?",
        gravity: Toastie.center,
        duration: Toastie.lengthLong,
      );
      return;
    }

    final postUrl =
        "https://wake-up-tofuswag.herokuapp.com/ammends/makeAmmend/";

    final response = await http.post(postUrl, body: {
      "name": orgName,
      "homepageLink": orgUrl,
      "baseUSDAmount": orgAmount,
      "description": orgDescription,
      "category": orgMission,
    });

    if (response.body == "Ammend added to DB.") {
      showToast(
        "Thank you! We appriciate it :)",
        gravity: Toastie.center,
        duration: Toastie.lengthLong,
      );
      setState(() {
        _orgName.text = "";
        _orgUrl.text = "";
        _orgAmount.text = "";
        _orgMission.text = "";
        _orgDescription.text = "";
      });
    } else {
      showToast(
        "There was an error! Try Again ?",
        gravity: Toastie.center,
        duration: Toastie.lengthLong,
      );
    }
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toastie.show(msg, context, duration: duration, gravity: gravity);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Text(
              "We need your help!",
              style: infoStyle,
            ),
            Text(
              "$info",
              style: infoStyle,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 50,
                width: screenWidth,
                color: Palette.ammendBack,
                child: Center(
                  child: InkWell(
                    onTap: _getDeviceLocation,
                    child: _location == null
                        ? Text(
                            "Location (Optional)",
                            style: TextStyle(
                                fontFamily: "OSSemiBold",
                                fontSize: 18,
                                color: Palette.editText),
                          )
                        : Text(
                            "You're one step closer to Waking Up!",
                            style: TextStyle(
                                fontFamily: "OSSemiBold",
                                fontSize: 16,
                                color: Palette.editText),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 50,
                width: screenWidth,
                color: Palette.ammendBack,
                child: Center(
                  child: TextFormField(
                    controller: _orgName,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(
                        fontFamily: "OSSemiBold",
                        fontSize: 18,
                        color: Palette.editText),
                    decoration: InputDecoration(
                      hintText: "Organization Name",
                    ),
                    cursorColor: Palette.accent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 50,
                width: screenWidth,
                color: Palette.ammendBack,
                child: Center(
                  child: TextFormField(
                    controller: _orgUrl,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(
                        fontFamily: "OSSemiBold",
                        fontSize: 18,
                        color: Palette.editText),
                    decoration: InputDecoration(
                      hintText: "Link To Website",
                    ),
                    cursorColor: Palette.accent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 50,
                width: screenWidth,
                color: Palette.ammendBack,
                child: Center(
                  child: TextFormField(
                    controller: _orgAmount,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(
                        fontFamily: "OSSemiBold",
                        fontSize: 18,
                        color: Palette.editText),
                    decoration: InputDecoration(
                      hintText: "Base Donation (INR)",
                    ),
                    cursorColor: Palette.accent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 50,
                width: screenWidth,
                color: Palette.ammendBack,
                child: Center(
                  child: TextFormField(
                    controller: _orgMission,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(
                        fontFamily: "OSSemiBold",
                        fontSize: 18,
                        color: Palette.editText),
                    decoration: InputDecoration(
                      hintText: "Mission (Water, Pollution, etc.)",
                    ),
                    cursorColor: Palette.accent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 50,
                width: screenWidth,
                color: Palette.ammendBack,
                child: Center(
                  child: TextFormField(
                    controller: _orgDescription,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    style: TextStyle(
                        fontFamily: "OSSemiBold",
                        fontSize: 18,
                        color: Palette.editText),
                    decoration: InputDecoration(
                      hintText: "Description",
                    ),
                    cursorColor: Palette.accent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 50,
                width: screenWidth,
                color: Palette.ammendBack,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      postAndClear(_orgName, _orgUrl, _orgAmount, _orgMission,
                          _orgDescription, _location);
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontFamily: "OSBold",
                          fontSize: 19,
                          color: Palette.textColor),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "After a careful selection of the genuine organization, you can expect them to be in Ammends tab of this app!",
                style: infoStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30.0, left: 30.0),
              child: Text(
                "Share the message. Wake Up!",
                style: infoStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
