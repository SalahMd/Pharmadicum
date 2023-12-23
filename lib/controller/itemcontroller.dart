import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/datasource/static.dart';
import 'package:pharmadicum/data/remote/favouriteback.dart';

abstract class ItemController extends GetxController {
  changeCount(int price, int n, bool isIncreasing);
  addToCart(Map medicine);
  addToFavorite(int id);
}

class ItemControllerImp extends ItemController {
  int count = 0;
  int sum = 0;
  bool isFavourite = false;
  Myservices myServices = Get.find();

  StatusRequest? favouriteStatusRequest;

  FavouriteBack favouriteBack = FavouriteBack(Get.put(Crud()));

  @override
  addToCart(Map medicine) {
    if (items.isNotEmpty) {
      for (int i = 0; i < items.length; i++) {
        if (items[i]['medicine_id'].toString() !=
            medicine['medicine_id'].toString()) {
          items.add(medicine);
          alert("added".tr);

          update();

          break;
        } else {
          alert("alreadyexist".tr);
          update();
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

  void onInit() {
    super.onInit();
  }

  @override
  addToFavorite(int id) async {
    var token = myServices.sharedPreferences.getString("token");
    var response = await favouriteBack.postData(token, id.toString());
    favouriteStatusRequest = hadelingData(response);
    if (StatusRequest.success == favouriteStatusRequest) {
      if (response['status'] == "success") {
        print("success");
      } else {
        print("error");
      }
    }
    update();
  }
}
