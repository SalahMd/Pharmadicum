import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/homepagecontroller.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/core/localization/changelanguage.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class ChangeTheLanguage extends GetView<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(
      builder: (controllerImp) => Scaffold(
        backgroundColor: Colorss.whiteColor,
        body: Column(
          children: [
            TopBar(
                isHomePage: false,
                title: "changelanguage".tr,
                height: Dimensions.fontSizee(context, 10)),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                controllerImp.medicines.clear();

                controller.changeLang("ar");
               
                controllerImp.getLanguages();
                Get.back();
                // Get.off(HomePage());
                // controllerImp.changePage(1);
              },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  height: 65,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colorss.lightColor,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "arabic".tr,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Container(
                            width: 40,
                            height: Dimensions.screenHeight(context) / 14,
                            child: Image.asset(Images.arabicimage)),
                      ])),
            ),
           const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                controllerImp.medicines.clear();
                controller.changeLang("en");
                controllerImp.getLanguages();
                Get.back();
              },
              child: Container(
                height: 65,
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colorss.lightColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("english".tr),
                    Container(
                        width: 40,
                        height: Dimensions.screenHeight(context) / 14,
                        child: Image.asset(Images.englishimage))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
