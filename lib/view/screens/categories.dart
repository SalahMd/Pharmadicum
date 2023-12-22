import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/homepagecontroller.dart';
import 'package:pharmadicum/core/class/statusrequest.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/view/widgets/loading.dart';
import 'package:pharmadicum/view/widgets/medicine.dart';
import 'package:pharmadicum/view/widgets/topbar.dart';

class Categories extends StatelessWidget {
  final String typeName;
  const Categories({super.key, required this.typeName});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
      builder: (controllerImp) => Scaffold(
        backgroundColor: Colors.white,
        body: controllerImp.categoryinfoStatusRequest == StatusRequest.loading
            ? Loading()
            : SingleChildScrollView(
                child: Column(children: [
                  TopBar(
                      isHomePage: false,
                      title: typeName,
                      height: Dimensions.fontSizee(context, 10)),
                  Container(
                    height: controllerImp.medicinesByType.length * 97,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controllerImp.medicinesByType.length,
                        itemBuilder: (BuildContext, int index) {
                          return GestureDetector(
                              onTap: () {
                                controllerImp.goToItemInfo(index, true);
                              },
                              child:
                                  Medicine(
                                    id:
                                    //index,
                                    controllerImp.medicinesByType[index]
                                              ['id'],
                                    image:controllerImp.medicinesByType[index]
                                              ['image'],
                                      name:controllerImp.medicinesByType[index]
                                              ['economic_name'],
                                      composition:  controllerImp.medicinesByType[index]
                                              ['scientific_name'],
                                      category: controllerImp.medicinesByType[index]
                                              ['category']['name'],
                                      price: controllerImp
                                          .medicinesByType[index]['unit_price']
                                          .toString(),
                                       isFavourite : controllerImp
                                          .medicinesByType[index]['is_favorite']?true:false,
                                          isHomePage: false,
                                  )
                                          );
                        }),
                  )
                ]),
              ),
      ),
    );
  }
}
