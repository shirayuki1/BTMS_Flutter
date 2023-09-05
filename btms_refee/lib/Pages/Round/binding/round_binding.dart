import 'package:btms_refee/Pages/Round/controller/round_controller.dart';
import 'package:get/get.dart';

class RoundBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<RoundController>(() => RoundController());
  }
}
