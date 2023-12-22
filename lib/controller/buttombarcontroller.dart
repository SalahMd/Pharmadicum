import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/view/screens/homepage.dart';
import 'package:pharmadicum/view/screens/profile.dart';
import 'package:pharmadicum/view/screens/settings.dart';

abstract class ButtomBarController extends GetxController {
  changePage(int currentPage);
}

class ButtomBarControllerImp extends ButtomBarController {
  int currentPage = 1;
  List<Widget> listPage = [Profile(), HomePage(), Settings()];
  @override
  changePage(int index) {
    currentPage = index;
    update();
  }
}