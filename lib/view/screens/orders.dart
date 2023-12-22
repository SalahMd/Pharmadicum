import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/orderscontroller.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/view/widgets/loading.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersControllerImp());
    return GetBuilder<OrdersControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: Colorss.whiteColor,
        body: controller.statusRequest == StatusRequest.loading
            ? Loading()
            : SingleChildScrollView(
                child: Column(children: [
                  TopBar(isHomePage: false, title: "myorders".tr, height: 80),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: controller.orders.length * 140,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.orders.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          padding: EdgeInsets.all(4),
                          height: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colorss.lightColor,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: controller.orders[index]
                                                      ['order_status_id']
                                                  .toString() ==
                                              "2"
                                          ? Colors.green
                                          : Colors.red[400],
                                    ),
                                    child: Text(
                                      controller.orders[index]
                                                      ['order_status_id']
                                                  .toString() ==
                                              "2"
                                          ? "delivered".tr
                                          : "pending".tr,
                                      style: TextStyles.medicineInfobody,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "order".tr +
                                            controller.orders[index]['id']
                                                .toString(),
                                        style: TextStyles.medicineNameStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        
                                        controller.orders[index]['created_at'],
                                        style: TextStyles
                                            .medicineCompositionStyle,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "totalprice".tr +
                                            controller.orders[index]
                                                ['total_invoice'],
                                        style: TextStyles
                                            .medicineCompositionStyle,
                                      ),
                                    ]),
                              ),

                            ],
                          ),
                        );
                      },
                    ),
                  )
                ]),
              ),
      ),
    );
  }
}
