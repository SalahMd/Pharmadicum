
import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class HomePageBack {
  Crud crud;
  HomePageBack(this.crud);
  postMedicineData(var token, var language,int page) async {
    var response = await this.crud.postWithHeaders(
        '${Links.medicines}?lang=$language&page=$page',
        {},
        {'Custom-Param': 'param_value', 'Authorization': 'Bearer $token'},
        false);
    return response.fold((l) => l, (r) => r);
  }

  getCategorieData(var token, var language) async {
    var response = await this.crud.postWithHeaders(
        '${Links.categories}?lang=$language',
        {},
        {'Custom-Param': 'param_value', 'Authorization': 'Bearer $token'},
        false);
    return response.fold((l) => l, (r) => r);
  }
}
