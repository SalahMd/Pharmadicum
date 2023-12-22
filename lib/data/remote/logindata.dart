import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postData(String phone, String password) async {
    var response = await crud.postData(Links.logIn, {
      "phone_number":phone,
      "password":password,
    },true);
    return response.fold((l) => l, (r) => r);
  }
}
