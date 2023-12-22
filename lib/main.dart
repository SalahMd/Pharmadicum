import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/constants/colors.dart';
import 'package:pharmadicum/core/constants/dimenesions.dart';
import 'package:pharmadicum/core/localization/changelanguage.dart';
import 'package:pharmadicum/core/localization/translation.dart';
import 'package:pharmadicum/core/middleware/midlleware.dart';
import 'package:pharmadicum/core/services/services.dart';
import 'package:pharmadicum/view/screens/auth/login.dart';
import 'package:pharmadicum/view/screens/auth/signup.dart';
import 'package:pharmadicum/view/screens/buttombar.dart';
import 'package:pharmadicum/view/screens/changepassword.dart';
import 'package:pharmadicum/view/screens/changethelanguage.dart';
import 'package:pharmadicum/view/screens/chooselanguage.dart';
import 'package:pharmadicum/view/screens/favourite.dart';
import 'package:pharmadicum/view/screens/search.dart';
import 'view/screens/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  //getLanguage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ChangeLanguage controller = Get.put(ChangeLanguage());
    return GetMaterialApp(
      locale: controller.language,
      translations: Translation(),
      theme: ThemeData(
          textTheme: TextTheme(
        headline1: TextStyle(
            color: Colorss.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSizee(context, 3.3),
            fontFamily:
                controller.language == "en" ? "PlayfairDisplay" : "Cairo"),
        headline2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSizee(context, 3.5),
            fontFamily:
                controller.language == "en" ? "PlayfairDisplay" : "Cairo"),
        headline3: TextStyle(
            color: Colorss.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSizee(context, 3.1),
            fontFamily:
                controller.language == "en" ? "PlayfairDisplay" : "Cairo"),
        bodyText1: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.fontSizee(context, 2.4),
            height: 1.5),
        bodyText2: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: Dimensions.fontSizee(context, 3),
        ),
      )),
      debugShowCheckedModeBanner: false,
      //initialBinding: InitialBinding(),
      getPages: [
         GetPage(
            name: "/",
            page: () => ChooseLanguage(),
            middlewares: [MiddleWare()]),
        GetPage(name: "/OnBoarding", page: () => OnBoarding()),
        GetPage(name: "/Login", page: () => Login()),
        GetPage(name: "/SignUp", page: () => SignUp()),
        GetPage(name: "/HomePage", page: () => ButtomBar()),
        GetPage(name: "/Search", page: () => Search()),
        GetPage(name: "/Favourite", page: () => Favourite()),
        GetPage(name: "/ChangeTheLanguage", page: () => ChangeTheLanguage()),
        GetPage(name: "/ChangePassword", page: () => ChangePassword()),
                GetPage(name: "/ChooseLanguage", page: () => ChooseLanguage()),

      ],
    );
  }
}
