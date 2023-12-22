import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/controller/homepagecontroller.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/textstyles.dart';

class Medicine extends StatelessWidget {
  final int id;
  final String name;
  final String composition;
  final String category;
  final bool? isFavourite;
  final bool isHomePage;
  final String image;
  final bool favourite = false;
  final Future Function()? ontapicon;

  //final int index;
  //final Uint8List bytes = base64.decoder();

  final String price;
  final void Function()? onPressed;
  const Medicine({
    super.key,
    required this.name,
    required this.composition,
    required this.category,
    required this.price,
    this.onPressed,
    this.isFavourite,
    required this.id,
    required this.isHomePage,
    required this.image,
    this.ontapicon,
  });
  Uint8List tranImage() {
    List<int> imageBytes = base64Decode(image);
    Uint8List uint8ImageBytes = Uint8List.fromList(imageBytes);
    return uint8ImageBytes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      decoration: BoxDecoration(
          color: Colorss.lightColor, borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Image.memory(
              tranImage(),
              fit: BoxFit.fill,
            )
            ),
        const Padding(padding: EdgeInsets.only(left: 5)),
        Expanded(
          flex: 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                name,
                style: TextStyles.medicineNameStyle,
              ),
              const Padding(padding: EdgeInsets.only(top: 1)),
              Text(
                composition,
                style: TextStyles.medicineCompositionStyle,
              ),
              const Padding(padding: EdgeInsets.only(top: 1)),
              Text(
                category,
                style: TextStyles.medicineCompositionStyle,
              ),
            ],
          ),
        ),
        GetBuilder<HomePageControllerImp>(
            builder: (controller) => Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("${"price2".tr}" + price,
                            style: TextStyles.medicinePriceStyle)
                      ],
                    ),
                  ),
                ))
      ]),
    );
  }
}
