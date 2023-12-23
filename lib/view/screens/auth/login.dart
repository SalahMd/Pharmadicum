import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/auth/logincontroller.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/animations.dart';
import 'package:pharmadicum/core/constants/buttons.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/customtextformfiled.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/core/functions/alerts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    return WillPopScope(
      onWillPop: exitAlert,
      child: GetBuilder<LogInControllerImp>(
        builder: (controllerImp) => Form(
          child: Scaffold(
            backgroundColor: Colorss.whiteColor,
            body: SingleChildScrollView(
              child: Form(
                key: controllerImp.formState,
                child: Column(children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "welcome".tr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
              
                  Container(
                    height: Dimensions.screenHeight(context) / 3,
                    width: Dimensions.screenwidth(context),
                    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: Image.asset(
                      Images.loginImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15,right: 15)
                        ,
                    child: Align(
                        alignment: controllerImp.language == "ar"
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Text("logintocontinue".tr)),
                  ),
                  Customtextformfiled(
                    hinttext: 'phone2'.tr,
                    labelText: 'phone1'.tr,
                    icondata: Icons.phone_enabled_outlined,
                    controller: controllerImp.phoneController,
                    min: 10,
                    max: 11,
                    isnumber: true,
                    ispassword: false,
                  ),
                  Customtextformfiled(
                    hinttext: 'password2'.tr,
                    labelText: 'password1'.tr,
                    icondata: Icons.lock_outline,
                    controller: controllerImp.passwordController,
                    min: 8,
                    max: 20,
                    isnumber: false,
                    ispassword: controllerImp.isshown,
                    ontapicon: () {
                          controllerImp.showPassword();
                        },
                  ),
              
                  const Padding(padding: EdgeInsets.only(top: 30)),
                  controllerImp.statusRequest==StatusRequest.loading?
                  Container(
                    alignment: Alignment.center,
                    width: 150,height: 60,child: Animations.loadingbutton
                  ,):
                   ElevatedButton(
                    onPressed: () {
                      controllerImp.logIn();
                    },
                    style: ButtonseApp.elevatedButtonStyle,
                    child: Text(
                      "loginbutton".tr,
                      style: TextStyles.textbuttonstyle,
                    ),
                  ),
                  //.animate().fade(duration:1000.ms).slideY(begin: 0.8,curve: Curves.easeInOut),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "create".tr,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            controllerImp.goToSignup();
                          },
                          child: Text(
                            "createbutton".tr,
                            style: TextStyle(color: Colorss.primaryColor),
                          )),
                    ],
                  )
                  //.animate().fade(duration:1000.ms).slideY(begin: 0.8,curve: Curves.easeInOut),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
