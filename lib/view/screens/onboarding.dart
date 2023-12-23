import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/onboardingcontroller.dart';
import 'package:pharmadicum/core/constants/buttons.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/data/datasource/static.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());

    return Scaffold(
      backgroundColor: Colorss.whiteColor,
      body: Column(children: [
        Expanded(
          flex: 3,
          child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (val) {
                controller.onPageChanged(val);
              },
              itemCount: onbordingmodel.length,
              itemBuilder: (context, int i) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 50)),
                      Expanded(
                        flex: 1,
                        child: Text(
                          onbordingmodel[i].title!,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      // Padding(padding: EdgeInsets.only(top: 30)),
                      Expanded(
                        flex: 2,
                        child: Container(
                            // width: 300,
                            // height: 230,
                            child: onbordingmodel[i].animation),
                      ),

                      Expanded(
                        flex: 2,
                        child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              onbordingmodel[i].body!,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1,
                            )),
                      ),
                    ],
                  )),
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                GetBuilder<OnBoardingControllerImp>(
                  builder: (controller) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          onbordingmodel.length,
                          (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 700),
                                width: controller.currentPage == index ? 20 : 8,
                                height: 8,
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.blue[900],
                                    borderRadius: BorderRadius.circular(20)),
                              )),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                ElevatedButton(
                  onPressed: () {
                    controller.next();
                  },
                  child: Text(
                    "continuebutton".tr,
                    style: TextStyles.textbuttonstyle,
                  ),
                  style: ButtonseApp.elevatedButtonStyle,
                ),
                TextButton(
                    onPressed: () {
                      //Get.to();
                      controller.currentPage = 4;
                      controller.next();
                    },
                    child: Text(
                      "skipbutton".tr,
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ))
              ],
            ))
      ]),
    );
  }
}
