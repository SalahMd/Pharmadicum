import 'package:get/get.dart';
import 'package:pharmadicum/core/constants/animations.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/data/model/medicinetypemodel.dart';
import 'package:pharmadicum/data/model/onboardingmodel.dart';

List<OnBoardingModel> onbordingmodel = [
  OnBoardingModel(
      title: "title1".tr, animation: Animations.animation1, body: "body1".tr),
  OnBoardingModel(
      title: "title2".tr, animation: Animations.animation4, body: "body2".tr),
  OnBoardingModel(
      title: "title3".tr, animation: Animations.animation3, body: "body3".tr),
  OnBoardingModel(
      title: "title4".tr, animation: Animations.animation2, body: "body4".tr),
];

List<MedicineTypeModel> medicineTypesModele = [
  MedicineTypeModel(image: Images.tabletimage),
  MedicineTypeModel(image: Images.ampulesImage),
  MedicineTypeModel(image: Images.tubesImage),
  MedicineTypeModel(image: Images.syrupImage),
  MedicineTypeModel(image: Images.dropsImage),
  MedicineTypeModel(image: Images.capsulesImage),
];

List items = [];
bool isBadge = false;