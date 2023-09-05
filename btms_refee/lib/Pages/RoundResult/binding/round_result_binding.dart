import 'package:btms_refee/Pages/RoundResult/controller/round_result_controller.dart';
import 'package:get/get.dart';

class RoundResultBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<RoundResultController>(() => RoundResultController());
  }
}
