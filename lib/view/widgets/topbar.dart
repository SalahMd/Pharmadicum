import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/functions/getlanguage.dart';
import 'package:pharmadicum/data/datasource/static.dart';

class TopBar extends StatelessWidget {
  final void Function()? onPressedProfileIcon;
  final void Function()? onPressedSearchIcon;
  final bool isHomePage;
  final String title;
  final double height;
  const TopBar({
    super.key,
    this.onPressedProfileIcon,
    required this.isHomePage,
    required this.title,
    required this.height,
    this.onPressedSearchIcon,
  });
  
  Widget build(BuildContext context) {
      //Get.put(CartControllerImp(),permanent: false);

    return Container(
      width: Dimensions.screenwidth(context),
      height: height + 5,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          color: Colorss.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: isHomePage
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getLanguage() == "en"
                          ? Dimensions.fontSizee(context, 2.8)
                          : Dimensions.fontSizee(context, 2.3)),
                )
                    .animate()
                    .fade(duration: 1000.ms)
                    .slideY(curve: Curves.easeInOut),
                isHomePage
                    ? IconButton(
                        icon: isBadge
                        
                            ? Badge(
                                smallSize: 13,
                                backgroundColor: Colors.red,
                                child: Icon(Icons.shopping_cart_outlined))
                            : Icon(Icons.shopping_cart_outlined),
                        iconSize: isHomePage ? 30 : 0,
                        color: Colors.white,
                        onPressed: onPressedProfileIcon,
                      )
                    : Text(""),
                //Padding(padding: EdgeInsets.only(left: 10)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: isHomePage
                ? InkWell(
                    onTap: onPressedSearchIcon,
                    child: Container(
                      width: Dimensions.screenwidth(context),
                      height: 40,
                      alignment: Alignment(-0.8, -0.3),
                      margin: EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: Row(children: [
                        Padding(
                          padding: getLanguage() == "en"
                              ? EdgeInsets.only(
                                  left: 10,
                                )
                              : EdgeInsets.only(
                                  right: 10,
                                ),
                          child: Container(
                              margin: EdgeInsets.all(5),
                              child: Icon(Icons.search)),
                        ),
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Text(
                          "search".tr,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ]),
                    ).animate().fade(begin: 0.1, end: 1, duration: 1000.ms),
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
