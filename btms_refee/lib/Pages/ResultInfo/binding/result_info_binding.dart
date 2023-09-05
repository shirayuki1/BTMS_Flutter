import 'package:btms_refee/Pages/ResultInfo/controller/result_info_controller.dart';
import 'package:get/get.dart';

class ResultInfoBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<ResultInfoController>(() => ResultInfoController());
  }
}
