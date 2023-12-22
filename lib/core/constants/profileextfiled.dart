import 'package:flutter/material.dart';

class ProfileTextFiled extends StatelessWidget {
  final String hinttext;
  final Icon icontext;

  const ProfileTextFiled(
      {super.key, required this.hinttext, required this.icontext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          fontSize: 19,
        ),
        hintText: hinttext,
        hintStyle: TextStyle(
          fontSize: 19,
        ),
        //contentPadding: EdgeInsets.only(right: 100),
        prefixIcon: icontext,
      ),
    );
  }
}
