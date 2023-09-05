import 'package:btms_refee/Pages/HistoryResultRankingTournament/controller/history_ranking_controller.dart';
import 'package:get/get.dart';

class HistoryRankingBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<HistoryRankingController>(() => HistoryRankingController());
  }
}
