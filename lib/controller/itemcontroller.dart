import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/datasource/static.dart';
import 'package:pharmadicum/data/remote/favouriteback.dart';
import 'package:pharmadicum/data/remote/medicine%20back.dart';

abstract class ItemController extends GetxController {
  changeCount(int price, int n, bool isIncreasing);
  addToCart(Map medicine);
  addToFavorite(int id);
  displayMedicine(int id);
}

class ItemControllerImp extends ItemController {
  final int id;
  ItemControllerImp(this.id);
  int count = 0;
  int sum = 0;
  bool isFavourite = false;
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  StatusRequest? favouriteStatusRequest;
  FavouriteBack favouriteBack = FavouriteBack(Get.put(Crud()));
  MedicineBack medicineBack = MedicineBack(Get.put(Crud()));
  Map info = {};

  @override
  addToCart(Map medicine) {
    print(medicine);
    if (items.isNotEmpty) {
      for (int i = 0; i < items.length; i++) {
        if (items[i]['medicine_id'] == medicine['medicine_id']) {
          alert("alreadyexist".tr);
          update();
          break;
        } else if(items[i]['medicine_id'] != medicine['medicine_id']&&i==items.length-1){
          items.add(medicine);
          alert("added".tr);
          update();
          break;
        }
      }
    } else {
      items.add(medicine);
      alert("added".tr);

      update();
    }
  }

  @override
  changeCount(int price, int n, bool isIncreasing) {
    if (count < n && isIncreasing) {
      count++;
      sum = price * count;
    } else if (count > 0 && !isIncreasing) {
      count--;
      sum = price * count;
    }
    update();
  }

  @override
  addToFavorite(int id) async {
    var token = myServices.sharedPreferences.getString("token");
    var response = await favouriteBack.postData(token, id.toString());
    favouriteStatusRequest = hadelingData(response);
    if (StatusRequest.success == favouriteStatusRequest) {
      if (response['status'] == "success") {
      } else {
        print("error");
      }
    }
    update();
  }

  @override
  void displayMedicine(int id) async {
    statusRequest = StatusRequest.loading;
    var token = myServices.sharedPreferences.getString("token");
    var language = myServices.sharedPreferences.getString("lang");
    var response = await medicineBack.postMedicineData(token, language, id);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        info.addAll(response['medicine']);
      } else {}
    }
    update();
  }

  @override
  void onInit() {
    displayMedicine(id);
    super.onInit();
  }
}
