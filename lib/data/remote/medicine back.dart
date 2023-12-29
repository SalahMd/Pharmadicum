import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class MedicineBack {
  Crud crud;
  MedicineBack(this.crud);
  postMedicineData(var token, var language,int id) async {
    var response = await crud.postWithHeaders(
        '${Links.medicines}/${id.toString()}?lang=$language',
        {},
        {'Custom-Param': 'param_value','Authorization': 'Bearer $token'},
        false);
    return response.fold((l) => l, (r) => r);
  }
}
