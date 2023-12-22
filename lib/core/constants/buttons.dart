import 'package:flutter/material.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';

class ButtonseApp {

  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colorss.primaryColor,
    padding: getLanguage() == "en"
        ? const EdgeInsets.only(left: 80, right: 80, top: 6, bottom: 5)
        : const EdgeInsets.only(left: 80, right: 80, top: 5, bottom: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static ButtonStyle elevatedSignUpButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colorss.primaryColor,
    padding: getLanguage() == "en"
        ? const EdgeInsets.only(left: 100, right: 100, top: 8, bottom: 8)
        : const EdgeInsets.only(left: 80, right: 80, top: 8, bottom: 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static ButtonStyle addToCartButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colorss.primaryColor,
    padding: getLanguage() == "en"
        ? const EdgeInsets.only(left: 60, right: 60, top: 6, bottom: 6)
        : const EdgeInsets.only(left: 60, right: 60, top: 9, bottom: 9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
  );

}
