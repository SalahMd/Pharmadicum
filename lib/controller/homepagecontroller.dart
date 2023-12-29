import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/remote/categoryback.dart';
import 'package:pharmadicum/data/remote/homepagedata.dart';
import 'package:pharmadicum/view/screens/cart.dart';
import 'package:pharmadicum/view/screens/iteminfo.dart';
import 'package:pharmadicum/view/screens/categories.dart';

abstract class HomePageController extends GetxController {
  goToItemInfo(int id, bool isByCategory);
  goToMedicineType(String typeName, String index);
  displayData();
  goToCart();
  goToSearch();
  displayTypeData(String index);
  getLanguages();
}

class HomePageControllerImp extends HomePageController {
  late var language = "en";
  List medicines = [];
  List categories = [];
  List medicinesByType = [];
  Myservices myServices = Get.find();
  CategoryBack categoryBack = CategoryBack(Get.put(Crud()));
  HomePageBack homePageBack = HomePageBack(Get.put(Crud()));
  StatusRequest? statusRequest;
  StatusRequest? categoryinfoStatusRequest;
  StatusRequest? categoryStatusRequest;
  late ScrollController scrollController;
  int page = 0;
  bool isLoading = false;
  bool isData = true;

  @override
  displayData() async {
    page += 1;
    if (page <= 1) statusRequest = StatusRequest.loading;
    update();
    var token = myServices.sharedPreferences.getString("token");
    var language = myServices.sharedPreferences.getString("lang");
    var response = await homePageBack.postMedicineData(token, language, page);
    if (page <= 1) {
      var response2 = await homePageBack.getCategorieData(token, language);
      categoryStatusRequest = hadelingData(response2);
      if (StatusRequest.success == categoryStatusRequest) {
        if (response2['status'] == "success") {
          categories.addAll(response2['categories']);
        } else {
          print("error");
        }
      }
    }
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['medicines'].isEmpty) {
          isData = false;
          return;
        }
        medicines.addAll(response['medicines']);
      } else {}
    }
    update();
  }

  @override
  goToItemInfo(int id, bool isByCategory) {
    if (!isByCategory) {
      if (medicines[id]['amount'] != 0) {
        Get.to(ItemInfo(
            id: medicines[id]['id']));
      } else {
        alert("notavilable".tr);
        update();
      }
    } else {
      if (medicinesByType[id]['amount'] != 0) {
        Get.to(ItemInfo(
            id: medicinesByType[id]['id']));
      } else {
        alert("notavilable".tr);
        update();
      }
    }
  }

  @override
  goToMedicineType(String typeName, String index) async {
    medicinesByType.clear();
    Get.to(Categories(
      typeName: typeName,
    ));
    update();
    displayTypeData(index);
    update();
  }

  @override
  goToCart() {
    Get.to(Cart());
  }

  @override
  goToSearch() {
    Get.toNamed("Search");
  }

  @override
  displayTypeData(String index) async {
    var token = myServices.sharedPreferences.getString("token");
    var language = myServices.sharedPreferences.getString("lang");
    categoryinfoStatusRequest = StatusRequest.loading;
    update();
    var response = await categoryBack.postData(index, token, language);
    categoryinfoStatusRequest = hadelingData(response);
    if (StatusRequest.success == categoryinfoStatusRequest) {
      if (response['status'] == "success") {
        medicinesByType.addAll(response['medicines']);
      }
    } else {
      print("error");
    }
    update();
  }

  @override
  void onInit() {
    language = getLanguage();
    displayData();
    update();
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.onInit();
  }

  @override
  getLanguages() {
    medicines.clear();
    language = getLanguage();
    page = 0;
    isLoading = false;
    isData = true;
    categories.clear();
    displayData();
  }

  Future<void> scrollListener() async {
    if (isLoading || !isData) {
      return;
    } else {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // isLoading = true;
        // update();
        await displayData();
        //update();
        // isLoading = false;
      }
    }
  }
}
