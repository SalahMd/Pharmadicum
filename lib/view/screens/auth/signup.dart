import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/auth/signupcontroller.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/animations.dart';
import 'package:pharmadicum/core/constants/buttons.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/customtextformfiled.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/core/functions/alerts.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return WillPopScope(
      onWillPop: exitAlert,
      child: GetBuilder<SignUpControllerImp>(
        builder: (controllerImp) => Form(
          key: controllerImp.formState,
          child: Scaffold(
            backgroundColor: Colorss.whiteColor,
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "signuptocontinue".tr,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Container(
                  width: Dimensions.screenwidth(context),
                  height: 260,
                  margin: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Image.asset(
                    Images.signUpImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Customtextformfiled(
                    hinttext: "username2".tr,
                    labelText: "username1".tr,
                    icondata: Icons.account_circle_outlined,
                    controller: controllerImp.pharmaciestNameController,
                    min: 3,
                    max: 12,
                    isnumber: false,
                    ispassword: false),
                Customtextformfiled(
                    hinttext: "phone2".tr,
                    labelText: "phone1".tr,
                    icondata: Icons.phone_enabled_outlined,
                    controller: controllerImp.phoneController,
                    min: 10,
                    max: 11,
                    isnumber: true,
                    ispassword: false),
                Customtextformfiled(
                    hinttext: "pharmacy2".tr,
                    labelText: "pharmacy1".tr,
                    icondata: Icons.local_pharmacy,
                    controller: controllerImp.pharmacyNameController,
                    min: 3,
                    max: 15,
                    isnumber: false,
                    ispassword: false),
                Customtextformfiled(
                    hinttext: "password2".tr,
                    labelText: "password1".tr,
                    icondata: Icons.lock_outline,
                    controller: controllerImp.passwordController,
                    min: 8,
                    max: 18,
                    isnumber: false,
                    ispassword: controllerImp.isshown,
                    ontapicon: () {
                          controllerImp.showPassword();
                        },
                    ),
                Customtextformfiled(
                    hinttext: "password2".tr,
                    labelText: "password1".tr,
                    icondata: Icons.lock_outline,
                    controller: controllerImp.confirmPasswordController,
                    min: 8,
                    max: 18,
                    isnumber: false,
                    ispassword: controllerImp.isshown,
                    ontapicon: () {
                          controllerImp.showPassword();
                        },
                    ),
                SizedBox(
                  height: 30,
                ),
                controllerImp.statusRequest == StatusRequest.loading
                    ? Container(
                        alignment: Alignment.center,
                        width: 150,
                        height: 60,
                        child: Animations.loadingbutton,
                      )
                    : ElevatedButton(
                        onPressed: () {
                          controllerImp.goToSuccessfulSignUp();
                        },
                        child: Text(
                          "createbutton".tr,
                          style: TextStyles.textbuttonstyle,
                        ),
                        style: ButtonseApp.elevatedSignUpButtonStyle,
                      ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "haveaccount".tr,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                        onPressed: () {
                          controllerImp.goToLogiIn();
                        },
                        child: Text(
                          "loginbutton".tr,
                          style: TextStyle(color: Colorss.primaryColor),
                        )),
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
