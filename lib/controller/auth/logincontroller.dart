import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/remote/logindata.dart';

abstract class LogiInController extends GetxController {
  logIn();
  goToHomePage();
  goToSignup();
  showPassword();
}

class LogInControllerImp extends LogiInController {
  bool isLoading = false;
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  LoginData loginData = new LoginData(Get.put(Crud())); //(Get.find)
  StatusRequest? statusRequest;
  Myservices myServices = Get.find();
  late var language;
  bool isshown = true;

  @override
  goToHomePage() {
    isLoading = true;
    update();
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed("HomePage");
    });
  }

  showPassword() {
    isshown = !isshown;
    update();
  }

  @override
  logIn() async {
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          phoneController.text, passwordController.text);
      statusRequest = hadelingData(response);
      if (StatusRequest.success == statusRequest) {
        print("login");
        print(response);
        if (response['status'] == "success") {
          if (response['user']['role_id'] == 2) {
            // data.addAll(response['data']);
            myServices.sharedPreferences.setInt("id", response['user']["id"]);

            myServices.sharedPreferences
                .setString("name", response['user']['name']);
            myServices.sharedPreferences
                .setString("phone_number", response['user']['phone_number']);
            myServices.sharedPreferences
                .setString("pharmacy_name", response['user']['pharmacy_name']);
            myServices.sharedPreferences
                .setString("token", response['user']["accessToken"]);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed("HomePage");
          } else {
          wrongLogin();
          update();
        }
        } else {
          wrongLogin();
          update();
        }
      } else {
        //wrongLogin();
        //update();
      }
      update();
    } else
      print("Not Valid");
  }

  @override
  goToSignup() {
    Get.offNamed("SignUp");
  }

  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void onInit() {
    language = getLanguage();
    print(language);
    update();
    phoneController = new TextEditingController();
    passwordController = new TextEditingController();
    super.onInit();
  }
}