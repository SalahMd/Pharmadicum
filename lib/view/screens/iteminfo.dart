import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/itemcontroller.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/buttons.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/core/functions/alerts.dart';

class ItemInfo extends StatelessWidget {
  final int id;
  double spaceBetween = 20;
  bool isFavorite = false;
  final String image;

  ItemInfo({super.key, required this.id, required this.image});

  Uint8List tranImage() {
    List<int> imageBytes = base64Decode(image);
    Uint8List uint8ImageBytes = Uint8List.fromList(imageBytes);
    return uint8ImageBytes;
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ItemControllerImp(id));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colorss.whiteColor,
          actions: [
            GetBuilder<ItemControllerImp>(
              builder: (controller) =>
                  controller.statusRequest == StatusRequest.loading
                      ? const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            Icons.favorite,
                            size: 30,
                          ),
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: 30,
                            color: controller.info['is_favorite']
                                ? Colors.red[400]
                                : Colors.grey,
                          ),
                          onPressed: () {
                            controller.addToFavorite(id);
                            controller.info['is_favorite'] =
                                !controller.info['is_favorite'];
                            controller.update();
                          },
                        ),
            ),
          ],
        ),
        backgroundColor: Colorss.whiteColor,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 715,
            child: Column(children: [
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 250,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                width: Dimensions.screenwidth(context),
                child: Hero(
                  tag: id,
                  child: Image.memory(
                    // key: ValueKey<int>(id), // Use id as the key
                    tranImage(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              GetBuilder<ItemControllerImp>(
                builder: (controllerImp) => controllerImp.statusRequest ==
                        StatusRequest.loading
                    ? Container()
                    : Expanded(
                        flex: 6,
                        child: Container(
                            padding: const EdgeInsets.only(
                              left: 2,
                              right: 2,
                              top: 5,
                            ),
                            child: Column(children: [
                              Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: ListTile(
                                        title: Text(
                                          controller.info['economic_name'],
                                          style: TextStyles.medicineInfoStyle,
                                        ),
                                        subtitle: Text(
                                          controller.info['scientific_name'],
                                          style: TextStyles.medicineInfobody,
                                        ),
                                        leading: Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                            Images.chemistryImage,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 4,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                controller.info['category']
                                                    ['name'],
                                                style: TextStyles
                                                    .medicineInfoStyle,
                                              ),
                                              leading: Container(
                                                width: 33,
                                                height: 33,
                                                child: Image.asset(
                                                  Images.medicineImage,
                                                  fit: BoxFit.fill,
                                                  // color: Colorss.primaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: ListTile(
                                        title: Text(
                                          "medicinecompany".tr,
                                          style: TextStyles.medicineInfoStyle,
                                        ),
                                        subtitle: Text(
                                          controller.info['company']['name'],
                                          style: TextStyles.medicineInfobody,
                                        ),
                                        leading: Container(
                                          width: 30,
                                          height: 30,
                                          child: Image.asset(
                                            Images.companyImage,
                                            fit: BoxFit.fill,
                                            // color: Colorss.primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: ListTile(
                                        title: Text(
                                          controller.info['amount'].toString(),
                                          style: TextStyles.medicineInfoStyle,
                                        ),
                                        leading: Container(
                                          width: 33,
                                          height: 33,
                                          child: Image.asset(
                                            Images.countImage,
                                            fit: BoxFit.fill,
                                            // color: Colorss.primaryColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                    title: Text(
                                      "medicinedate".tr,
                                      style: TextStyles.medicineInfoStyle,
                                    ),
                                    subtitle: Text(
                                      "2025-5-10",
                                      style: TextStyles.medicineInfobody,
                                    ),
                                    leading: Icon(
                                      Icons.calendar_month_outlined,
                                      color: Colors.blue[700],
                                      size: 35,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                    title: Text(
                                      "price".tr,
                                      style: TextStyles.medicineInfoStyle,
                                    ),
                                    subtitle: Text(
                                      controller.info['unit_price'].toString(),
                                      style: TextStyles.medicineInfobody,
                                    ),
                                    leading: Icon(
                                      Icons.attach_money,
                                      color: Colors.blue[700],
                                      size: 35,
                                    )),
                              ]),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //SizedBox(width: 25),
                                    Text(
                                      "totalprice".tr,
                                      style: TextStyles.medicineInfoStyle,
                                    ),
                                    controllerImp.sum != 0
                                        ? Text(controllerImp.sum.toString(),
                                            style: TextStyles.priceStyle)
                                        : Text("",
                                            style: TextStyles.priceStyle),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (controllerImp.count != 0) {
                                              controllerImp.addToCart({
                                                "medicine_id": id,
                                                "amount": controllerImp.count
                                                    .toString(),
                                                "unit_price": controller
                                                    .info['unit_price']
                                                    .toString(),
                                                "category": controller
                                                    .info['category']['name'],
                                                "name": controller
                                                    .info['economic_name'],
                                                "total_price": controllerImp.sum
                                                    .toString(),
                                                "composition_name": controller
                                                    .info['scientific_name'],
                                              });
                                            } else {
                                              alert("addamount".tr);
                                            }
                                          },
                                          style:
                                              ButtonseApp.addToCartButtonStyle,
                                          child: Text(
                                            "addtolist".tr,
                                            style: TextStyles.textbuttonstyle,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                  flex: 1,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      controllerImp.changeCount(
                                                          controller.info[
                                                              'unit_price'],
                                                          int.parse(controller
                                                              .info['amount']),
                                                          false);
                                                    },
                                                    icon: Icon(
                                                      Icons
                                                          .indeterminate_check_box_outlined,
                                                      color:
                                                          Colorss.primaryColor,
                                                    ),
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${controllerImp.count}",
                                                    style: TextStyles.itembody,
                                                    textAlign: TextAlign.center,
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: IconButton(
                                                    onPressed: () {
                                                      controllerImp.changeCount(
                                                          controller.info[
                                                              'unit_price'],
                                                          int.parse(controller
                                                              .info['amount']),
                                                          true);
                                                    },
                                                    icon: Icon(
                                                        Icons.add_box_outlined,
                                                        color: Colorss
                                                            .primaryColor),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      )
                                    ]),
                              )
                            ]))),
              )
            ]),
          ),
        ));
  }
}
