import 'package:flutter/material.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';

class ListTiles extends StatelessWidget {
  final Icon leadingIcon;
  final Icon trailingIcon;
  //final Function onPressed;
  final String listText;

  const ListTiles(
      {super.key,
      required this.leadingIcon,
      required this.trailingIcon,
      //required this.onPressed,
      required this.listText});
  @override
  Widget build(BuildContext context) {
    double circleSize = Dimensions.fontSizee(context, 4.6);

    return ListTile(
      leading: Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colorss.primaryColor),
          child: leadingIcon),
      trailing: Container(
        width: circleSize,
        height: circleSize,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.grey[300]),
        child: trailingIcon,
      ),
      title: Padding(
        padding: EdgeInsets.only(left: 13.0),
        child: Text(
          listText,
          style: TextStyle(
            fontSize: Dimensions.fontSizee(context, 2.3),
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
