import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/constants/animations.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';

Future<bool> exitAlert() {
  Get.defaultDialog(
      title: "",
      middleText: "warningbody".tr,
      middleTextStyle: TextStyles.alertsStyle,
      actions: [
        TextButton(
            onPressed: () {
              exit(0);
            },
            child: Text("yes".tr)),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("no".tr))
      ]);
  return Future.value(true);
}

Future<bool> sendAlert(var animation,String title) {
  Get.defaultDialog(
      title: title,
      titleStyle: TextStyles.alertsStyle,
      titlePadding: EdgeInsets.symmetric(vertical: 20),
      content: Container(height: 200, child:animation),
      barrierDismissible: false);
  return Future.value(true);
}

Future<bool> alert(String Text) {
  Get.defaultDialog(
      title: Text,
      middleText: "",
      titleStyle: TextStyles.alertsStyle,
      titlePadding: EdgeInsets.only(top: 60),
      //content: Container(height: 150, child:Animations.info)
      );
  return Future.value(true);
}

Future<bool> wrongLogin() {
  Get.defaultDialog(
      title: "wronglogin".tr,
      titleStyle: TextStyles.alertsStyle,
      titlePadding: EdgeInsets.only(top: 10, left: 10, right: 10),
      barrierDismissible: false,
      content: Container(height: 100, child: Animations.wrongAuth));
  return Future.value(true);
}
