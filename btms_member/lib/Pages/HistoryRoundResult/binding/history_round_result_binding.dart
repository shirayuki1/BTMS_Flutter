import 'package:btms_member/Pages/HistoryRoundResult/controller/history_round_result_controller.dart';
import 'package:get/get.dart';

class HistoryRoundResultBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<HistoryRoundResultController>(
        () => HistoryRoundResultController());
  }
}
