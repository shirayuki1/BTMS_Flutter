import 'package:btms_refee/Pages/BirdList/controller/bird_controller.dart';
import 'package:get/get.dart';

class BirdBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<BirdController>(() => BirdController());
  }
}
