import 'package:btms_refee/Pages/HistoryRoundResult/controller/round_result_history_controller.dart';
import 'package:get/get.dart';

class RoundResultHistoryBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<RoundResultHistoryController>(
        () => RoundResultHistoryController());
  }
}
