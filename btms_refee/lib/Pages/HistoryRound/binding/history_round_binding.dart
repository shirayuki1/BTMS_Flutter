import 'package:btms_refee/Pages/HistoryRound/controller/history_round_controller.dart';
import 'package:get/get.dart';

class RoundHistoryBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<RoundHistoryController>(() => RoundHistoryController());
  }
}
