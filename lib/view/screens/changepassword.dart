import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/auth/changepassword.dart';
import 'package:pharmadicum/core/constants/buttons.dart';
import 'package:pharmadicum/core/constants/customtextformfiled.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChangePasswordControllerImp controllerImp =
        Get.put(ChangePasswordControllerImp());
    return Scaffold(
      body: Form(
        key: controllerImp.formState,
        child: Column(
          children: [
            TopBar(
                isHomePage: false,
                title: "changepassword".tr,
                height: Dimensions.fontSizee(context, 10)),
            SizedBox(
              height: 30,
            ),
            Text(
              "changepasswordbody".tr,
              style: Theme.of(context).textTheme.headline3,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Customtextformfiled(
              hinttext: "phone2".tr,
              labelText: "phone1".tr,
              icondata: Icons.lock,
              controller: controllerImp.password,
              min: 10,
              max: 11,
              isnumber: true,
              ispassword: false,
            ),
            Customtextformfiled(
              hinttext: "password2".tr,
              labelText: "password1".tr,
              icondata: Icons.lock,
              controller: controllerImp.password,
              min: 7,
              max: 15,
              isnumber: false,
              ispassword: true,
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            ElevatedButton(
              onPressed: () {
                //controllerImp.goToLogin();
              },
              child: Text("confirm".tr, style: TextStyles.textbuttonstyle),
              style: ButtonseApp.elevatedButtonStyle,
            )
          ],
        ),
      ),
    );
  }
}
