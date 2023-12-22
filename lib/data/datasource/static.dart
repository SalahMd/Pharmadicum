import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:pharmadicum/core/constants/animations.dart';
import 'package:pharmadicum/core/constants/images.dart';
import 'package:pharmadicum/data/model/medicinemodel.dart';
import 'package:pharmadicum/data/model/medicinetypemodel.dart';
import 'package:pharmadicum/data/model/onboardingmodel.dart';

List<OnBoardingModel> Onbordingmodel = [
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

List<MedicineModel> medicineModels = [
  MedicineModel(
      name: "Zednad",
      composition: 'Cefuroxim',
      companyName: 'Diamond',
      count: 6,
      type: "Syrups",
      date: '2025',
      price: 12000,
      image: Images.zednadsImage),
  MedicineModel(
      name: "Telmi",
      composition: 'Telmisartan',
      companyName: 'Diamond',
      count: 2,
      type: "Tablets",
      date: '2025',
      price: 10500,
      image: Images.telmiImage),
  MedicineModel(
      name: "Alquide",
      composition: 'fexofenadine',
      companyName: 'Diamond',
      count: 2,
      type: "Tablets",
      date: '2025',
      price: 10500,
      image: Images.alquideImage),
];
// List<OrderModel> orderModel = [
//   OrderModel(medicineModels,date:"2/5/2023"
//   , id: 1, name: "Order"+"${1.toString()}", situation: "Delivered", totalPrice: 300000),
//   OrderModel(medicineModels,date:"15/5/2023"
//   , id: 2, name: "Order"+"${2.toString()}", situation: "Pending", totalPrice: 125000),
// ];
List items = [];
bool isBadge = false;
