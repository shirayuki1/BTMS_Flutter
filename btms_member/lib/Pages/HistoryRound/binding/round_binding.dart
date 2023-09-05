import 'package:btms_member/Pages/HistoryRound/controller/round_controller.dart';
import 'package:get/get.dart';

class RoundHistoryBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<RoundHistoryController>(() => RoundHistoryController());
  }
}
