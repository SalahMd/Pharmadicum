import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/buttombarcontroller.dart';
import 'package:pharmadicum/core/constants/colors.dart';

class ButtomBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Get.put(ButtomBarControllerImp());
    return GetBuilder<ButtomBarControllerImp>(
      builder: (controllerImp) => Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          // key: _bottomNavigationKey,
          index: 1,
          onTap: (index) {
            controllerImp.changePage(index);},
          items:  [
             Icon(
              Icons.account_circle,
              color: Colorss.whiteColor,
            ),
            Icon(Icons.home, color: Colorss.whiteColor),
            Icon(Icons.settings, color: Colorss.whiteColor),
          ],
          backgroundColor: Colorss.whiteColor,
          buttonBackgroundColor: Colors.blue[900],
          color: Colorss.primaryColor,
          height: 50,
        ),
        body: controllerImp.listPage.elementAt(controllerImp.currentPage),
      ),
    );
  }


}