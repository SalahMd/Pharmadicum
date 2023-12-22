import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/homepagecontroller.dart';
import 'package:pharmadicum/controller/itemcontroller.dart';
import 'package:pharmadicum/core/constants/buttons.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/core/functions/alerts.dart';

// ignore: must_be_immutable
class ItemInfo extends GetView<HomePageControllerImp> {
  final int id;
  final String name;
  final String composition;
  final String category;
  final String company;
  final String count;
  final String expDate;
  final int price;
  final String image;
  bool isFavourite;
  double spaceBetween = 20;

  ItemInfo(this.name, this.composition, this.category, this.company, this.count,
      this.expDate, this.price, this.image, this.isFavourite,
      {super.key, required this.id});

  Uint8List tranImage() {
    List<int> imageBytes = base64Decode(image);
    Uint8List uint8ImageBytes = Uint8List.fromList(imageBytes);
    // Uint8List image = imageBytes.last;
    return uint8ImageBytes;
  }

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colorss.whiteColor,
          actions: [
            GetBuilder<ItemControllerImp>(
              builder: (controller) => IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                  color: isFavourite ? Colors.red[400] : Colors.grey,
                ), // Replace 'your_icon' with the desired icon
                onPressed: () {
                  controller.addToFavorite(id);
                  isFavourite = !isFavourite;
                  controller.update();
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colorss.whiteColor,
        body: SingleChildScrollView(
          child: Container(
            height: 715,
            child: Column(children: [
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 3,
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    width: Dimensions.screenwidth(context),
                    child:
                        // Text("")
                        Image.memory(
                      tranImage(),
                      fit: BoxFit.fill,
                    )),
              ),
              GetBuilder<ItemControllerImp>(
                builder: (controllerImp) => Expanded(
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
                                      name,
                                      style: TextStyles.medicineInfoStyle,
                                    ),
                                    subtitle: Text(
                                      composition,
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
                                            category,
                                            style: TextStyles.medicineInfoStyle,
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
                                      company,
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
                                      count.toString(),
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
                                  expDate,
                                  style: TextStyles.medicineInfobody,
                                ),
                                leading: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.blue[700],
                                  size: 35,
                                )
                                //Container(width: 50,height: 50,child: Image.asset(Images.companyImage,fit: BoxFit.fill,),

                                ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                                title: Text(
                                  "price".tr,
                                  style: TextStyles.medicineInfoStyle,
                                ),
                                subtitle: Text(
                                  price.toString(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //SizedBox(width: 25),
                                Text(
                                  "totalprice".tr,
                                  style: TextStyles.medicineInfoStyle,
                                ),
                                controllerImp.sum != 0
                                    ? Text(controllerImp.sum.toString(),
                                        style: TextStyles.priceStyle)
                                    : Text("", style: TextStyles.priceStyle),
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
                                            "medicine_id": id.toString(),
                                            "amount":
                                                controllerImp.count.toString(),
                                            "unit_price": price.toString(),
                                            "category": category,
                                            "name": name,
                                            "total_price":
                                                controllerImp.sum.toString(),
                                            "composition_name": composition,
                                          });
                                        } else {
                                          alert("addamount".tr);
                                        }
                                      },
                                      style: ButtonseApp.addToCartButtonStyle,
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
                                                      price,
                                                      int.parse(count),
                                                      false);
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .indeterminate_check_box_outlined,
                                                  color: Colorss.primaryColor,
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
                                                      price,
                                                      int.parse(count),
                                                      true);
                                                },
                                                icon: Icon(
                                                    Icons.add_box_outlined,
                                                    color:
                                                        Colorss.primaryColor),
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
