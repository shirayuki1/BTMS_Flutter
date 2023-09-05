// import 'package:btms/Pages/History/controller/history_controller.dart';
import 'package:btms_refee/Pages/History/controller/history_controller.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
