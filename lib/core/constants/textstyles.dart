import 'package:flutter/material.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';

class TextStyles {
  static TextStyle textbuttonstyle = TextStyle(
      color: Colors.white,
      fontSize:  17,
      fontWeight: FontWeight.w400);
  static TextStyle itemtitle = TextStyle(
      color: Colors.black,
      fontSize: getLanguage() == "en" ? 26 : 23,
      fontWeight: FontWeight.bold);
  static TextStyle itembody = TextStyle(
      color: Colors.grey[800], fontSize: 20, fontWeight: FontWeight.w400);
  static TextStyle medicineType = TextStyle(
      color: Colors.blue[800],
      fontSize:16,
      fontWeight: FontWeight.w400);
  static TextStyle medicineNameStyle = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400);
  static TextStyle medicineCompositionStyle = TextStyle(
      color: Colors.black38,
      fontSize:  13,
      fontWeight: FontWeight.w400);
  static TextStyle medicinePriceStyle = TextStyle(
      color: Colors.black38,
      fontSize:12,
      fontWeight: FontWeight.w400);
  static TextStyle medicineInfoStyle = TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold);
  static TextStyle medicineInfobody = TextStyle(
      color: Colors.black54,
      fontSize: 14,
      fontWeight: FontWeight.w400);
  static TextStyle priceStyle =
      TextStyle(color: Colors.green, fontSize: 21, fontWeight: FontWeight.w400);
  static TextStyle totalpriceStyle = TextStyle(
      color: Colors.black,
      fontSize: getLanguage() == "en" ? 22 : 18,
      fontWeight: FontWeight.w400);

  static TextStyle smallordertitlesStyle = TextStyle(
      color: Colors.black,
      fontSize: getLanguage() == "en" ? 10 : 7,
      fontWeight: FontWeight.bold);
  static TextStyle ordertitlesStyle = TextStyle(
      color: Colors.black,
      fontSize: getLanguage() == "en" ? 12 : 9,
      fontWeight: FontWeight.bold);
  static TextStyle alertsStyle = TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w400);
}
