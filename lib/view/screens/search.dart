import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/searchcontroller.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/view/widgets/medicine.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(SearchControllerImp());
    return GetBuilder<SearchControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: Colorss.whiteColor,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                width: Dimensions.screenwidth(context),
                height: 60,
                child: TextFormField(
                  controller: controller.searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(),
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.displayData();
                      },
                      child: Icon(
                        Icons.search,
                        size: 25,
                        color: Colorss.primaryColor,
                      ),
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        controller.goToHomePage();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colorss.primaryColor,
                      ),
                    ),
                    enabled: true,
                    hintText: "search".tr,
                    hintStyle: const TextStyle(fontSize: 17),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding: const EdgeInsets.only(
                        left: 20, right: 5, top: 15, bottom: 15),
                  ),
                )),
            Container(
              alignment: Alignment.topCenter,
              height: controller.data.length * 97,
              child: ListView.builder(
                  itemCount: controller.data.length,
                  padding: EdgeInsets.only(top: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext, int index) {
                    return controller.data.isEmpty
                        ? Center(
                            child: Text(
                              "noitems".tr,
                              style: TextStyles.itembody,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              controller
                                  .goToItemInfo(index);
                              print(controller.data[index]);
                              //controller.goToItemInfo(index);
                            },
                            child: Medicine(
                              id:controller.data[index]['id'],
                              image: controller.data[index]['image'],
                              name: controller.data[index]['economic_name'],
                              composition:controller.data[index]
                                      ['scientific_name'],
                              category: controller.data[index]['category']
                                      ['name'],
                              price: controller.data[index]['unit_price']
                                  .toString(),
                                  isFavourite: controller.data[index]['is_favorite']?true:false,
                                  isHomePage: false,
                                  //ontapicon: controller.addToFavourite(index),
                            ));
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
