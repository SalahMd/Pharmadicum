// import 'package:pharmadicum/core/class/crud.dart';
// import 'package:pharmadicum/core/constants/links.dart';

// class CategoryBack {
//   Crud crud;
//   CategoryBack(this.crud);
//   postData(String category) async {
//     var response = await crud.postWithHeaders(Links.display, {
//       "category":category,
//     },{'Custom-Param': 'param_value'},false);
//     return response.fold((l) => l, (r) => r);
//   }
// }


import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class CategoryBack {
  Crud crud;
  CategoryBack(this.crud);

  postData(String category,var token,var language) async {
    var response = await crud.postWithHeaders(
      '${Links.medicines}?category=$category&lang=$language',{}, // Include category in the URL parameters
      {'Custom-Param': 'param_value','Authorization': 'Bearer $token'},
      false,
    );
    return response.fold((l) => l, (r) => r);
  }
}
