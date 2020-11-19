import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakeup/components/amend_card.dart';
import 'package:wakeup/configs/amend_data.dart';
import 'package:wakeup/configs/palette.dart';
import 'package:wakeup/configs/toastie.dart';
import 'package:wakeup/networking/networking_ammends.dart';

class Amends extends StatefulWidget {
  @override
  _AmendsState createState() => _AmendsState();
}

class _AmendsState extends State<Amends> {
  final _newtworkingAmend = NetworkingAmmend();
  Future<List<AmendData>> _getAmends() async {
    final amendsDataList = await _newtworkingAmend.getAmendsDataFromApi();
    return amendsDataList;
  }

  TextStyle infoStyle =
      TextStyle(fontFamily: "OSBold", fontSize: 13, color: Palette.authorColor);
  void showToast(String msg, {int duration, int gravity}) {
    Toastie.show(msg, context, duration: duration, gravity: gravity);
  }

  @override
  Widget build(BuildContext context) {
    final listMan = FutureBuilder<List<AmendData>>(
        future: _getAmends(),
        builder:
            (BuildContext context, AsyncSnapshot<List<AmendData>> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Palette.accent),
              ),
            );
          } else {
            var amendsFromApi = snapshot.data;
            return Container(
              height: 500,
              child: ListView.builder(
                itemCount: amendsFromApi.length,
                itemBuilder: (BuildContext context, int index) {
                  var link = amendsFromApi[index].link;
                  return InkWell(
                    onTap: () async {
                      if (await canLaunch(link)) {
                        await launch(link);
                      } else {
                        showToast(
                          "Looks like there isn't a valid link. Add one yourself in the You tab.",
                          gravity: Toastie.center,
                          duration: Toastie.lengthLong,
                        );
                      }
                    },
                    child: AmendCard(
                      title: amendsFromApi[index].title,
                      amount: amendsFromApi[index].amount,
                      description: amendsFromApi[index].description,
                      type: amendsFromApi[index].type,
                    ),
                  );
                },
              ),
            );
          }
        });
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
            "These are few ammends to make some wrongs right. While this wont fix all the damage we’ve done to mother earth, we need to remember ; Rome wasnt built in a day ",
            style: infoStyle),
        listMan,
      ],
    );
  }
}
