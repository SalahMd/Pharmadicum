import 'package:pharmadicum/data/model/medicinemodel.dart';

class OrderModel {
  final int id;
  final String name;
  final String situation;
  final String date;
  final int totalPrice;
  final List<MedicineModel>medicinemodel;
  OrderModel(this.medicinemodel,  {required this.id, required this.date,required this.name, required this.situation, required this.totalPrice});
  
}
