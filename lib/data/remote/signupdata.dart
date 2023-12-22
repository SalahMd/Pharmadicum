import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class SignUpBack {
  Crud crud;
  SignUpBack(this.crud);
  postData(String name, String pharmacyName, String phone,String password,) async {
    var response = await this.crud.postData(Links.signUp, {
      "name":name,
      "pharmacy_name":pharmacyName,
      "phone_number":phone,
      "password":password,
    },true);
    return response.fold((l) => l, (r) => r);
  }
}
