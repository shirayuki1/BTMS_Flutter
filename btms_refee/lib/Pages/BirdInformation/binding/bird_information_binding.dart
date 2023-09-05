import 'package:btms_refee/Pages/BirdInformation/controller/bird_information_controller.dart';
import 'package:get/get.dart';

class BirdInformationBinding extends Bindings {
  @override
  void dependencies() {
    // Bind Building Details controller
    Get.lazyPut<BirdInformationController>(() => BirdInformationController());
  }
}
