import 'package:get/get.dart';

class CartModel {
   String? cartName;
  final String medicineCount;
  final int totalPrice;
  final String situation = "unsent".tr;

  CartModel(
      {required this.cartName,
      required this.medicineCount,
      required this.totalPrice});
}
