import 'package:get/get.dart';
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/functions/handelingdata.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/data/remote/orderBack.dart';

abstract class OrdersController extends GetxController {
 // deleteOrder(int index);
  displayOrders();
}

class OrdersControllerImp extends OrdersController {
  Myservices myServices = Get.find();
  StatusRequest? statusRequest;
  OrderBack orderBack = new OrderBack(Get.put(Crud()));
  List orders = [];
  @override
  // deleteOrder(int index) {
  //   orderModel.removeAt(index);
  //   update();
  // }

  @override
  displayOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var token = myServices.sharedPreferences.getString("token");
    var response = await orderBack.postData(token);
    print(response);

    statusRequest = hadelingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        orders.addAll(response['orders']);
      } else {
        print("error");
      }
    }
    //print(response);
    update();
  }

  onInit() {
    displayOrders();
    super.onInit();
  }
}
