import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wakeup/components/amend_card.dart';
import 'package:wakeup/configs/amend_data.dart';
import 'package:wakeup/configs/palette.dart';
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
            return InkWell(child: AmendCard(
              title: "hello",
              description: "hahavjjvbjsbvsbkv this is tenjafbja aahfhajajn ",
              type: "contribute",
              amount: 5,
            ));
            // return Container(
            //   height: 500,
            //   child: ListView.builder(
            //     itemCount: amendsFromApi.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         tileColor: Palette.cardBackground,
            //         title: Text(amendsFromApi[index].title),
            //         subtitle: Text(amendsFromApi[index].description),
            //         onTap: () async {
            //           var amendUrl = amendsFromApi[index].urlToTag;
            //           if (await canLaunch(amendUrl)) {
            //             await launch(amendUrl);
            //           }
            //         },
            //       );
            //     },
            //   ),
            // );
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
