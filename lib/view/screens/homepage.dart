import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/homepagecontroller.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/functions/alerts.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/view/widgets/loading.dart';
import 'package:pharmadicum/view/widgets/medicine.dart';
import 'package:pharmadicum/view/widgets/medicinetypes.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class HomePage extends StatelessWidget {
  Color notFavourite = Colors.white;
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageControllerImp(),permanent: false);
    return WillPopScope(
      onWillPop: exitAlert,
      child: GetBuilder<HomePageControllerImp>(
        builder: (controllerImp) => Scaffold(
          backgroundColor: Colorss.whiteColor,
          body: controllerImp.statusRequest == StatusRequest.loading ||
                  controllerImp.categoryStatusRequest == StatusRequest.loading
              ? Loading()
              : SingleChildScrollView(
                  controller: controllerImp.scrollController,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TopBar(
                          onPressedProfileIcon: () {
                            controllerImp.goToCart();
                          },
                          onPressedSearchIcon: () {
                            controllerImp.goToSearch();
                          },
                          isHomePage: true,
                          title: "home".tr,
                          height: 140,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: getLanguage() == "ar"
                              ? const EdgeInsets.only(right: 18)
                              : const EdgeInsets.only(left: 18),
                          child: Align(
                              alignment: getLanguage() == "ar"
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: Text(
                                "categories".tr,
                                style: Theme.of(context).textTheme.headline1,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const MedicineTypes(),
                        Padding(
                          padding: getLanguage() == "ar"
                              ? const EdgeInsets.only(right: 18)
                              : const EdgeInsets.only(left: 18),
                          child: Align(
                              alignment: getLanguage() == "ar"
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: Text(
                                "popular".tr,
                                style: Theme.of(context).textTheme.headline1,
                              )),
                        ),
                        SizedBox(
                          height:
                          // controllerImp.isLoading
                            //  ? (controllerImp.medicines.length + 1) * 97
                              //:
                               controllerImp.medicines.length * 97,
                          child: ListView.builder(
                              padding: const EdgeInsets.only(top: 15),
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controllerImp.isLoading
                                  ? controllerImp.medicines.length + 1
                                  : controllerImp.medicines.length,
                              itemBuilder: (BuildContext, int index) {
                                if (index < controllerImp.medicines.length) {
                                  return GestureDetector(
                                      onTap: () {
                                        controllerImp.goToItemInfo(
                                            index, false);
                                      },
                                      child: Medicine(
                                        id:controllerImp.medicines[index]
                                            ['id'],
                                        name: controllerImp.medicines[index]
                                            ['economic_name'],
                                        image: controllerImp.medicines[index]
                                            ['image'],
                                        composition:
                                            controllerImp.medicines[index]
                                                ['scientific_name'],
                                        category: controllerImp.medicines[index]
                                            ['category']['name'],
                                        price: controllerImp.medicines[index]
                                                ['unit_price']
                                            .toString(),
                                        isFavourite:
                                            controllerImp.medicines[index]
                                                        ['is_favorite'],
                                        isHomePage: true,
                                      ));
                                } 
                                // else {
                                //   return Center(
                                //     child: CircularProgressIndicator(
                                //       color: Colorss.primaryColor,
                                //     ),
                                //   );
                                // }
                              }),
                        ),
                      ]),
                ),
        ),
      ),
    );
  }
}