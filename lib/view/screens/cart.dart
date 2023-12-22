import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/cartcontroller.dart';
import 'package:pharmadicum/core/constants/buttons.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/data/datasource/static.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

// ignore: must_be_immutable
class Cart extends StatelessWidget {
  TextStyle style = const TextStyle(
      color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return Scaffold(
      backgroundColor: Colorss.whiteColor,
      body: GetBuilder<CartControllerImp>(
        builder: (controller) => Column(children: [
          TopBar(
              isHomePage: false,
              title: "cart".tr,
              height: Dimensions.fontSizee(context, 10)),
          const SizedBox(
            height: 20,
          ),
          items.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    controller.displayContent();
                  },
                  child: Container(
                    width: Dimensions.screenwidth(context),
                    height: getLanguage() == "en" ? 312 : 330,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colorss.lightColor,
                    ),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${controller.cartmodel.cartName}"),
                          IconButton(
                            icon: const Icon(
                              Icons.restore_from_trash,
                              color: Colors.red,
                              size: 35,
                            ),
                            onPressed: () {
                              controller.deleteCart();
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Text("medicine".tr, style: style),
                         const  SizedBox(width: 10),
                          Text(
                            items.length.toString(),
                            style: style,
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Text("totalprice".tr, style: style),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(controller.totalPrice.toString(),
                              style: style),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 7),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Text("ordersituation".tr, style: style),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("unsent".tr, style: style),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          controller.sendOrder();
                        },
                        style: ButtonseApp.elevatedButtonStyle,
                        child: Text("confirm".tr,
                            style: TextStyles.textbuttonstyle),
                      ),
                    ]),
                  ),
                )
              : SizedBox(
                  height: 100,
                  child: Center(
                    child: Text("noorders".tr,style: TextStyles.itembody),
                  ))
        ]),
      ),
    );
  }
}
