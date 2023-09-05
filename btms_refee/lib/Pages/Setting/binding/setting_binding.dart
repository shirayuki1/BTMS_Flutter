import 'package:btms_refee/Pages/Setting/controller/setting_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
