import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/homepagecontroller.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';
import 'package:pharmadicum/data/datasource/static.dart';

class MedicineTypes extends StatelessWidget {
  final void Function()? onPressedMedicineType;

  const MedicineTypes({super.key, this.onPressedMedicineType});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomePageControllerImp());
    return Container(
      width: Dimensions.screenwidth(context),
      height: 260,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //int n = index + 1;
                controller.goToMedicineType(
                   controller.categories[index]['name'], controller.categories[index]['id'].toString());
              },
              child: Container(
                  width: 110,
                  height: 75,
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  decoration: BoxDecoration(
                      //color: Colors.grey.withOpacity(0.1),
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.2),
                      //     spreadRadius: 2,
                      //     blurRadius: 2,
                      //     offset: Offset(3, 3),
                      //   ),
                      // ],
                      border:
                          Border.all(width: 1.5, color: Colorss.primaryColor),
                      borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "${medicineTypesModele[index].image}",
                        scale: 10,
                        colorBlendMode: BlendMode.srcOver,
                      ),
                      Text(
                      // controller.language=="en"?
                      //   controller.categories[index]['name_EN']
                      //   :
                      controller.categories[index]['name']
                        ,style: TextStyles.medicineType,
                      )
                    ],
                  )),
            );
          }),
    );
  }
}

// Positioned(
                //   top: -5,
                //   right: getLanguage() == "ar" ? -10 : 80,
                //   child: Container(
                //       width: 50,
                //       height: 50,
                //       child: Image.asset(
                //         "${medicineTypesModele[index].image}",
                //         fit: BoxFit.fill,
                //       )),
                // )