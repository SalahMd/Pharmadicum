import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class OrderBack {
  Crud crud;
  OrderBack(this.crud);
  postData(var token) async {
    var response = await this.crud.postWithHeaders(Links.order, {
    },{'Authorization': 'Bearer $token'},false);
    return response.fold((l) => l, (r) => r);
  }
}
