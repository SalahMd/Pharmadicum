import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/remote/orderBack.dart';

abstract class OrdersController extends GetxController {
  displayOrders();
}

class OrdersControllerImp extends OrdersController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  OrderBack orderBack =  OrderBack(Get.put(Crud()));
  List orders = [];

  @override
  displayOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var token = myServices.sharedPreferences.getString("token");
    var response = await orderBack.postData(token);
    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        orders.addAll(response['orders']);
      } else {
        print("error");
      }
    }
    update();
  }

  @override
  onInit() {
    displayOrders();
    super.onInit();
  }
}
