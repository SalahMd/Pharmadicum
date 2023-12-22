import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/remote/favouriteback.dart';
import 'package:pharmadicum/view/screens/iteminfo.dart';

abstract class FavouriteController extends GetxController {
  displayFavourite();
  getLanguages();
  goToItemInfo(int id);
}

class FavouriteControllerImp extends FavouriteController {
  StatusRequest? statusRequest;
  late var Language;
  Myservices myServices = Get.find();
  FavouriteBack favouriteBack = new FavouriteBack(Get.put(Crud()));
  List favourite = [];
  StatusRequest? favouriteStatusRequest;
  @override
  displayFavourite() async {
    statusRequest = StatusRequest.loading;
    favourite.clear();
    var token = myServices.sharedPreferences.getString("token");
    var language = myServices.sharedPreferences.getString("lang");
    var response = await favouriteBack.getData(token, language);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        favourite.addAll(response['favorites']);
      }
    } else
      print("Error");
    update();
  }

  @override
  goToItemInfo(int id) {
    if(favourite[id]['amount'] != 0){
    Get.to(ItemInfo(
      favourite[id]['economic_name'],
      favourite[id]['scientific_name'],
      favourite[id]['category']['name'],
      favourite[id]['company']['name'],
      favourite[id]['amount'],
      favourite[id]['batches'][0]['expiration_date'],
      favourite[id]['unit_price'],
      favourite[id]['image'],
      true,
      id:favourite[id]['id'],
    ));
    }else{
      alert("notavilable".tr);
        update();
    }
  }


  void onInit() {
    favourite.clear();
    getLanguages();
    displayFavourite();
    super.onInit();
  }

  @override
  getLanguages() {
    Language = getLanguage();
  }
}
