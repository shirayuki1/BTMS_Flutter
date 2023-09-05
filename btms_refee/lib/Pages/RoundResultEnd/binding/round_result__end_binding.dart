import 'package:btms_refee/Pages/RoundResultEnd/controller/round_result_end_controller.dart';
import 'package:get/get.dart';

class RoundResultEndBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<RoundResultEndController>(() => RoundResultEndController());
  }
}
