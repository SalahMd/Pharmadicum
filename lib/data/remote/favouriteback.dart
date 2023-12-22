import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class FavouriteBack {
    Crud crud;
  FavouriteBack(this.crud);
  postData(var token,String id) async {
    var response = await this.crud.postWithHeaders(Links.favourite, {
      "medicine_id":id,
    },{'Content-Type': 'application/json','Authorization': 'Bearer $token'},true);
    return response.fold((l) => l, (r) => r);
  }
  getData (var token,var language)async{
    var response = await this.crud.postWithHeaders('${Links.favourite}?lang=$language' , {
    },{'Custom-Param': 'param_value','Authorization': 'Bearer $token'},false);
    return response.fold((l) => l, (r) => r);
  }
}