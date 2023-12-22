import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/settingscontroller.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/view/screens/orders.dart';
import 'package:pharmadicum/view/widgets/listtile.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SettingControllerImp());
    return WillPopScope(
      onWillPop: exitAlert,
      child: GetBuilder<SettingControllerImp>(
        builder: (controller) => Scaffold(
            backgroundColor: Colorss.whiteColor,
            body: Column(
              children: [
                TopBar(
                    isHomePage: false,
                    title: "settings".tr,
                    height: Dimensions.fontSizee(context, 10)),
                Expanded(
                  flex: 2,
                  child: Container(
                    //width: Dimensions.screenwidth(context),
                    padding: EdgeInsets.all(15),
                    margin: const EdgeInsets.only(
                      bottom: 25,
                    ),
                    child: Image.asset(
                      Images.settingsImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    width: Dimensions.screenwidth(context),
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed("Favourite");
                            },
                            child: ListTiles(
                                leadingIcon: Icon(
                                  Icons.favorite_outline,
                                  color: Colorss.whiteColor,
                                ),
                                trailingIcon: Icon(Icons.arrow_forward),
                                listText: "favourite".tr),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(Orders());
                            },
                            child: ListTiles(
                                leadingIcon: Icon(
                                  Icons.list_alt_outlined,
                                  color: Colorss.whiteColor,
                                ),
                                trailingIcon: Icon(Icons.arrow_forward),
                                listText: "myorders".tr),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed("ChangePassword");
                            },
                            child: ListTiles(
                                leadingIcon: Icon(
                                  Icons.lock_outlined,
                                  color: Colorss.whiteColor,
                                ),
                                trailingIcon: Icon(Icons.arrow_forward),
                                listText: "changepassword".tr),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed("ChangeTheLanguage");
                            },
                            child: ListTiles(
                                leadingIcon: Icon(
                                  Icons.translate_outlined,
                                  color: Colorss.whiteColor,
                                ),
                                trailingIcon: Icon(Icons.arrow_forward),
                                listText: "changelanguage".tr),
                          ),
                          InkWell(
                            onTap: ()async {
                             await controller.logOut();
                            },
                            child: ListTiles(
                                leadingIcon: Icon(
                                  Icons.logout_outlined,
                                  color: Colorss.whiteColor,
                                ),
                                trailingIcon: Icon(Icons.arrow_forward),
                                listText: "logout".tr),
                          ),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            )),
      ),
    );
  }
}
