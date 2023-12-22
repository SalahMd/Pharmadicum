import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class LogOutBack {
  Crud crud;
  LogOutBack(this.crud);
  postData(var token) async {
    var response = await crud
        .postWithHeaders(Links.logOut,{},{'Authorization': 'Bearer $token'},true);
    return response.fold((l) => l, (r) => r);
  }
}
