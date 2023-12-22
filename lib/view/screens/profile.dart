import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/core/constants/profileextfiled.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';
import 'package:pharmadicum/core/services/services.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
    Myservices myServices = Get.find();

  Icon nameIcon = Icon(
    Icons.account_circle_outlined,
    size: 24,
    color: Colorss.primaryColor,
  );
  Icon pharmacyIcon = Icon(
    Icons.local_pharmacy_outlined,
    size: 24,
    color: Colorss.primaryColor,
  );
  Icon passwordIcon = Icon(
    Icons.lock_outline,
    size: 24,
    color: Colorss.primaryColor,
  );
  Icon phoneIcon = Icon(
    Icons.phone,
    size: 24,
    color: Colorss.primaryColor,
  );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitAlert,
      child: Scaffold(
          backgroundColor: Colorss.whiteColor,
          body: Column(
            children: [
              TopBar(
                  isHomePage: false,
                  title: "profile".tr,
                  height: Dimensions.fontSizee(context, 10)),
              Expanded(
                flex: 2,
                child: Container(
                  // width: Dimensions.screenwidth(context),
                  margin: const EdgeInsets.only(left: 60, right: 60, top: 10),
                  child: Image.asset(
                    Images.profileImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                    padding:const EdgeInsets.only(bottom: 40),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.topCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfileTextFiled(
                            hinttext: "${myServices.sharedPreferences.getString("name")}"
                                
                                ,
                            icontext: nameIcon),
                        const SizedBox(
                          height: 10,
                        ),
                        ProfileTextFiled(hinttext: "${myServices.sharedPreferences.getString("pharmacy_name")}", icontext: pharmacyIcon),
                       const SizedBox(
                          height: 10,
                        ),
                        ProfileTextFiled(hinttext: "${myServices.sharedPreferences.getString("phone_number")}", icontext: phoneIcon),
                        const SizedBox(
                          height: 10,
                        ),
                        //ProfileTextFiled(hinttext: "${myServices.sharedPreferences.getString("email")}", icontext: passwordIcon),
                       const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              ),
            ],
          )),
    );
  }
}
