import 'package:pharmadicum/core/class/statusrequest.dart';

hadelingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
