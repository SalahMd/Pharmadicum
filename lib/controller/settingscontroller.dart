import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/remote/logoutdata.dart';

abstract class SettingController extends GetxController {
  logOut();
  goToFavourite();
  goToOrders();
}

class SettingControllerImp extends SettingController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  LogOutBack log_Out = new LogOutBack(Get.put(Crud()));

  @override
  goToFavourite() {}

  @override
  goToOrders() {}

  @override
  logOut() async {
    statusRequest = StatusRequest.loading;
    var token = myServices.sharedPreferences.getString("token");
    var response = await log_Out.postData(token);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        myServices.sharedPreferences.clear();
        Get.offNamed("ChooseLanguage");
      } else {
        print("error");
      }
    } else {}
  }
}
