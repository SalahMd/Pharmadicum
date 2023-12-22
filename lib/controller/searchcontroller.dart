import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/remote/searchback.dart';
import 'package:pharmadicum/view/screens/iteminfo.dart';

abstract class SearchController extends GetxController {
  goToHomePage();
  displayData();
  goToItemInfo(int index);
}

class SearchControllerImp extends SearchController {
  List data = [];
  StatusRequest? statusRequest;
  late var Language;
  Myservices myServices = Get.find();
  late TextEditingController searchController;
  SearchBack searchBack = new SearchBack(Get.put(Crud()));

  @override
  displayData() async {
    data.clear();
    update();
    var token = myServices.sharedPreferences.getString("token");
    var language = myServices.sharedPreferences.getString("lang");
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await searchBack.postData(searchController.text, token, language);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['medicines']);
        update();
        print(response['data']);
      }
    }
  }

  @override
  goToItemInfo(int id) {
    if (data[id]['amount'] != 0) {
      Get.to(ItemInfo(
        data[id]['economic_name'],
        data[id]['scientific_name'],
        data[id]['category']['name'],
        data[id]['company']['name'],
        data[id]['amount'].toString(),
        data[id]['batches'][0]['expiration_date'],
        data[id]['unit_price'],
        data[id]['image'],
        data[id]['is_favorite'],
        id: data[id]['id'],
      ));
    }else {
        alert("notavilable".tr);
        update();
      }
  }

  @override
  goToHomePage() {
    Get.back();
  }

  onInit() {
    Language = getLanguage();
    searchController = new TextEditingController();
    super.onInit();
  }

  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
