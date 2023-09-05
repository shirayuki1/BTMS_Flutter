import 'package:btms_member/Pages/HistoryDetail/controller/history_detail_controller.dart';
import 'package:get/get.dart';

class HistoryDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<HistoryDetailsController>(() => HistoryDetailsController());
  }
}
