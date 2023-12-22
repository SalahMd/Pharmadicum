import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/favouritecontroller.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/view/widgets/loading.dart';
import 'package:pharmadicum/view/widgets/medicine.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      Get.put(FavouriteControllerImp(),permanent: false);
    return GetBuilder<FavouriteControllerImp>(
    
      builder: (controller) => Scaffold(
        backgroundColor: Colorss.whiteColor,
        body: 
        controller.statusRequest == StatusRequest.loading ?Loading():
         SingleChildScrollView(
          child: Column(children: [
            TopBar(
                isHomePage: false,
                title: "favourite".tr,
                height: Dimensions.fontSizee(context, 10)),
            SizedBox(
              height: controller.favourite.length * 125,
              child: ListView.builder(
                itemCount: controller.favourite.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        // controllerImp.goToItemInfo(index);
                        controller.goToItemInfo(index);
                        
                       },
                      child: Medicine(
                        id: controller.favourite[index]['id'],
                        image:  controller.favourite[index]['image'],
                        name: controller.favourite[index]['economic_name'],
                        composition: controller.favourite[index]['scientific_name'],
                        category: controller.favourite[index]['category']
                                ['name'],
                        price: controller.favourite[index]['unit_price']
                            .toString(),
                            isHomePage: false,
                            isFavourite:controller.favourite[index]['is_favorite'] ,
                      ));
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
