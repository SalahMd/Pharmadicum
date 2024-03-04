import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/cartcontroller.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/data/datasource/static.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class CartInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: Colorss.whiteColor,
        body: SingleChildScrollView(
          child: Column(children: [
            TopBar(
                isHomePage: false,
                title: "My Order",
                height: Dimensions.fontSizee(context, 10)),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Container(
                  width: Dimensions.screenwidth(context),
                  height: 65,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colorss.tableColor, width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(children: [
                    Expanded(
                        flex: 3,
                        child: Text(
                          "name".tr,
                          textAlign: TextAlign.center,
                          style: TextStyles.ordertitlesStyle,
                        )),
                    VerticalDivider(
                      thickness: 1,
                      color: Colorss.tableColor,
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "type".tr,
                          textAlign: TextAlign.center,
                          style: TextStyles.ordertitlesStyle,
                        )),
                    VerticalDivider(
                      thickness: 1,
                      color: Colorss.tableColor,
                    ),
                    Expanded(
                        flex: 1,
                        child: Text("count".tr,
                            textAlign: TextAlign.center,
                            style: TextStyles.smallordertitlesStyle)),
                    VerticalDivider(
                      thickness: 1,
                      color: Colorss.tableColor,
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          "totalprice".tr,
                          style: TextStyles.smallordertitlesStyle,
                          textAlign: TextAlign.center,
                        )),
                    VerticalDivider(
                      thickness: 1,
                      color: Colorss.tableColor,
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          "",
                          style: TextStyles.smallordertitlesStyle,
                          //textAlign: TextAlign.center,
                        ))
                  ]),
                ),
                ListView.builder(
                  shrinkWrap:true,
                  padding: EdgeInsets.only(bottom: 2),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: Dimensions.screenwidth(context),
                      height: 65,
                      padding: EdgeInsets.all(5),
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colorss.tableColor, width: 1),
                          borderRadius: BorderRadius.circular(1)),
                      child: Row(children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                 items[index]['name'],
                                style: TextStyles.medicineNameStyle,
                              ),
                              Text(
                                 items[index]['composition_name'],
                                style: TextStyles.medicineCompositionStyle,
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          thickness: 1,
                          color: Colorss.tableColor,
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(
                              items[index]['category'],
                              textAlign: TextAlign.center,
                              style: TextStyles.medicineInfobody,
                            )),
                        VerticalDivider(
                          thickness: 1,
                          color: Colorss.tableColor,
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              items[index]['amount'].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyles.medicineInfobody,
                            )),
                        VerticalDivider(
                          thickness: 1,
                          color: Colorss.tableColor,
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(items[index]['total_price'],
                                textAlign: TextAlign.center,
                                style: TextStyles.medicineInfobody)),
                        VerticalDivider(
                          thickness: 1,
                          color: Colorss.tableColor,
                        ),
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(
                                Icons.restore_from_trash,
                                color: Colors.red[500],
                                size: 22,
                              ),
                              onPressed: () {
                                controller.deleteItem(index);
                              },
                            ))
                      ]),
                    );
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
