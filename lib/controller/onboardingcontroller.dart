import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/datasource/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
  Myservices multiService = Get.find();
  @override
  next() {
    currentPage++;
    if (currentPage > onbordingmodel.length - 1) {
      multiService.sharedPreferences.setString("step", "1");
      Get.offAllNamed("Login");
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
