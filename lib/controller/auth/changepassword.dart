import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ChangePasswordController extends GetxController {
  goToLogin();
  resetPassword();
}

class ChangePasswordControllerImp extends ChangePasswordController {
  GlobalKey<FormState> formState =  GlobalKey<FormState>();
  late TextEditingController password;
  @override
  goToLogin() {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      Get.offNamed("Login");
    } else {
      print("Not valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }

  @override
  resetPassword() {}
}
