import 'package:pharmadicum/core/class/crud.dart';
import 'package:pharmadicum/core/constants/links.dart';

class CartBack {
  Crud crud;
  CartBack(this.crud);
  postData(var token,String totalInvoice,List items) async {
    var response = await this.crud.postWithHeaders(Links.cart, {
      "total_invoice":totalInvoice,
      "items":items,
    },{'Content-Type': 'application/json','Authorization': 'Bearer $token'},true);
    return response.fold((l) => l, (r) => r);
  }
}
