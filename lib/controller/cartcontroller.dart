import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/animations.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/datasource/static.dart';
import 'package:pharmadicum/data/model/cartmodel.dart';
import 'package:pharmadicum/data/remote/cartback.dart';
import 'package:pharmadicum/view/screens/cartinfo.dart';

abstract class CartController extends GetxController {
  displayContent();
  sendOrder();
  deleteCart();
  deleteItem(int index);
}

class CartControllerImp extends CartController {
  late CartModel cartmodel;
  int totalPrice = 0;
  late var language;
  Myservices myServices = Get.find();
  bool isBadgee = false;
  StatusRequest? statusRequest;
  CartBack cartback = CartBack(Get.put(Crud()));
  @override
  displayContent() {
    Get.to(CartInfo());
  }

  @override
  sendOrder() async {
    sendAlert(Animations.confirmloading, "sendingbody".tr);
    update();
    var token = myServices.sharedPreferences.getString("token");
    var response = await cartback.postData(token, totalPrice.toString(), items);
    print(response);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print("done");
      } else {
        print(response['status']);
      }
    } else {
      print("errorrrr");
    }
    Get.back();

    cartmodel = CartModel(cartName: null, medicineCount: '', totalPrice: 0);
    items.clear();
    update();
  }

  void onInit() {
  
    getLanguages();
    if (items.isNotEmpty) {
      isBadgee = false;
      update();
      for (int i = 0; i < items.length; i++) {
        totalPrice += int.parse(items[i]['total_price']);
      }
      cartmodel = CartModel(
          cartName: 'order'.tr+"1", medicineCount: '10', totalPrice: 120334);
    } else {
      cartmodel = CartModel(cartName: null, medicineCount: '', totalPrice: 0);
    }
    super.onInit();
  }
  

  @override
  deleteCart() {
    cartmodel.cartName = null;
    items.clear();
    isBadgee = false;
    update();
  }

  @override
  deleteItem(int index) {
    items.removeAt(index);
    if(items.isEmpty) {
      isBadgee = false;
    }
    update();
  }

  getLanguages() {
    language = getLanguage();
    update();
  }
}
