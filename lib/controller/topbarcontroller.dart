import 'package:get/get.dart';
import 'package:pharmadicum/data/datasource/static.dart';

abstract class TopBarController extends GetxController {
  checkBaddge();
}

class TopBarControllerImp extends TopBarController {
  bool isBadge = false;
  @override
  bool checkBaddge() {
    if (items.isNotEmpty) {
      isBadge = true;
    } else {
      isBadge = false;
    }

    update();
    return isBadge;
  }

  @override
  void onInit() {
    checkBaddge();
    super.onInit();
  }
}
