import 'package:get/get.dart';

import '../controller/checkin_controller.dart';

class CheckinBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<CheckinController>(() => CheckinController());
  }
}
