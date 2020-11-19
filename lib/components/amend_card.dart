import 'package:flutter/material.dart';
import 'package:wakeup/configs/palette.dart';

class AmendCard extends StatefulWidget {
  final String title;
  final String description;
  final String type;
  final int amount;

  const AmendCard(
      {Key key, this.title, this.description, this.type, this.amount})
      : super(key: key);

  @override
  _AmendCardState createState() => _AmendCardState();
}

class _AmendCardState extends State<AmendCard> {
  String _title;
  String _description;
  String _type;
  int _amount;

  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _description = widget.description;
    _type = widget.type;
    _amount = widget.amount;
  }

  @override
  Widget build(BuildContext context) {
    final titleTheme = Theme.of(context).textTheme.caption;
    final authorTheme = Theme.of(context).textTheme.bodyText1;
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _screenWidth = MediaQuery.of(context).size.width;

    final tagColor = {
      "contribute": Palette.global,
      "habit": Palette.food,
      "campaign": Palette.climate,
    };
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
      color: Palette.cardBackground,
      elevation: 0.0,
      child: Container(
        height: _screenHeight / 7,
        width: _screenWidth,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "$_title",
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
                    "Min Donation: $_amount Dollars",
                    style: TextStyle(
                        color: Palette.authorColor,
                        fontFamily: "OSBold",
                        fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () {},
                  color: tagColor[_type],
                  textColor: Colors.white,
                  child: Text(
                    "$_type".substring(0,1).toUpperCase() + "$_type".substring(1,"$_type".length),
                    style: TextStyle(fontFamily: "OSBold"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "$_description",
                    style: TextStyle(
                        color: Palette.textColor, fontFamily: "OSSemiBold"),
                    overflow: TextOverflow.ellipsis,
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
