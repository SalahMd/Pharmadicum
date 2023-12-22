import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class SearchBack {
  Crud crud;
  SearchBack(this.crud);
  postData(String search,var token,var language) async {
    var response = await crud.postWithHeaders( '${Links.medicines}?search=$search&lang=$language', {
    },{
      'Custom-Param': 'param_value','Authorization': 'Bearer $token'
    },false);
    return response.fold((l) => l, (r) => r);
  }
}
