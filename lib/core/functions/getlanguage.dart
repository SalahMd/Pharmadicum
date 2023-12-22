import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/services/services.dart';

getLanguage() {
  Myservices myservices = Get.find();
  String? sharedpreflang = myservices.sharedPreferences.getString("lang");
  print(sharedpreflang);
  if (sharedpreflang == "ar") {
    return sharedpreflang;
  } else if (sharedpreflang == "en") {
    return sharedpreflang;
  } else {
    return Locale(Get.deviceLocale!.languageCode);
  }
}
