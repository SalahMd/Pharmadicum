import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/data/remote/signupdata.dart';

abstract class SignUpController extends GetxController {
  goToLogiIn();
  goToSuccessfulSignUp();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController pharmacyNameController;
  late TextEditingController phoneController;
  late TextEditingController pharmaciestNameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  GlobalKey<FormState> formState =  GlobalKey<FormState>();
  SignUpBack signup_back = SignUpBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  bool isshown = true;

  @override
  showPassword() {
    isshown = !isshown;
    update();
  }

  @override
  goToLogiIn() {
    Get.offNamed("Login");
  }

  @override
  goToSuccessfulSignUp() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signup_back.postData(
          pharmaciestNameController.text,
          pharmacyNameController.text,
          phoneController.text,
          passwordController.text);
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed("Login");
        } else {
          Get.defaultDialog(title: "", middleText: "warningbody2".tr);
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    phoneController = TextEditingController();
    pharmaciestNameController = TextEditingController();
    pharmacyNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phoneController.dispose();
    pharmaciestNameController.dispose();
    pharmacyNameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
