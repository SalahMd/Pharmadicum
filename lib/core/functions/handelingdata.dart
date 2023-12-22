import 'package:pharmadicum/core/class/statusrequest.dart';

hadelingData(response) {
  if (response is StatusRequest) {
    print(response);
    return response;
  } else {
    print(response);
    return StatusRequest.success;
  }
}
